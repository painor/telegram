import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import '../crypto/auth_key.dart';
import '../crypto/IGE.dart';
import '../crypto/RSA.dart';
import '../crypto/factorizator.dart';
import '../errors/common.dart';
import '../extensions/binary_reader.dart';
import '../utils.dart';
import '../tl/requests/requests.dart';
import '../tl/constructors/constructors.dart';
import 'MTProto_plain_sender.dart';

doAuthentication(MTProtoPlainSender sender, log) async {
  // Step 1 sending: PQ Request, endianness doesn't matter since it's random
  var bytes = generateRandomBytes(16);

  final nonce = readBigIntFromBuffer(bytes, little: false, signed: true);
  final ResPQ resPQ = await sender.send(new ReqPqMulti(nonce: nonce));
  log.debug('Starting authKey generation step 1');

  if (!(resPQ is ResPQ)) {
    throw ('Step 1 answer was ${resPQ}');
  }
  if (resPQ.nonce != nonce) {
    print("Sent nonce $nonce");
    print("Recieved Nonce ${resPQ.nonce}");
    throw new SecurityError('Step 1 invalid nonce from server');
  }
  final pq = readBigIntFromBuffer(resPQ.pq, little: false, signed: true);
  log.debug('Finished authKey generation step 1');
  log.debug('Starting authKey generation step 2');
  // Step 2 sending: DH Exchange
  final factRes = Factorizator.factorize(pq);
  var p_int = factRes['p'];
  var q_int = factRes['q'];
  // TODO Bring back after 'Factorizator' fix.
  final List<int> p = getByteArray(p_int);
  final List<int> q = getByteArray(q_int);

  bytes = generateRandomBytes(32);
  final newNonce = readBigIntFromBuffer(bytes, little: true, signed: true);

  final pqInnerData = new PQInnerData(
    pq: getByteArray(pq),
    // unsigned
    p: p,
    q: q,
    nonce: resPQ.nonce,
    serverNonce: resPQ.serverNonce,
    newNonce: newNonce,
  );

  // sha_digest + data + random_bytes
  var cipherText = null;
  var targetFingerprint = null;
  for (final fingerprint in resPQ.serverPublicKeyFingerprints) {
    cipherText = await RSAencrypt(fingerprint, pqInnerData.getBytes());
    if (cipherText != null && cipherText != null) {
      targetFingerprint = fingerprint;
      break;
    }
  }
  if (cipherText == null) {
    throw new SecurityError('Step 2 could not find a valid key for fingerprints');
  }
  var obj = new ReqDHParams(
    nonce: resPQ.nonce,
    serverNonce: resPQ.serverNonce,
    p: p,
    q: q,
    publicKeyFingerprint: targetFingerprint,
    encryptedData: cipherText,
  );
  final serverDhParams = await sender.send(
    new ReqDHParams(
      nonce: resPQ.nonce,
      serverNonce: resPQ.serverNonce,
      p: p,
      q: q,
      publicKeyFingerprint: targetFingerprint,
      encryptedData: cipherText,
    ),
  );
  if (!(serverDhParams is ServerDHParamsOk || serverDhParams is ServerDHParamsFail)) {
    throw ('Step 2.1 answer was ${serverDhParams}');
  }
  if (serverDhParams.nonce != resPQ.nonce) {
    throw new SecurityError('Step 2 invalid nonce from server');
  }

  if (serverDhParams.serverNonce != (resPQ.serverNonce)) {
    throw new SecurityError('Step 2 invalid server nonce from server');
  }

  if (serverDhParams is ServerDHParamsFail) {
    final List<int> sh = sha1.convert(toSignedLittleBuffer(newNonce, number: 32).sublist(4, 20)).bytes;
    final nnh = readBigIntFromBuffer(sh, little: true, signed: true);
    if (serverDhParams.newNonceHash != (nnh)) {
      throw new SecurityError('Step 2 invalid DH fail nonce from server');
    }
  }
  if (!(serverDhParams is ServerDHParamsOk)) {
    throw ('Step 2.2 answer was ${serverDhParams}');
  }
  log.debug('Finished authKey generation step 2');
  log.debug('Starting authKey generation step 3');

  // Step 3 sending: Complete DH Exchange
  final resData = await generateKeyDataFromNonce(resPQ.serverNonce, newNonce);
  final key = resData['key'];
  final iv = resData['iv'];
  if (serverDhParams.encryptedAnswer.length % 16 != 0) {
    // See PR#453
    throw new SecurityError('Step 3 AES block size mismatch');
  }
  final plainTextAnswer = IGE.decryptIge(serverDhParams.encryptedAnswer, key, iv);
  final reader = new BinaryReader(plainTextAnswer);
  reader.read(length: 20); // hash sum
  final ServerDHInnerData serverDhInner = reader.tgReadObject();
  if (!(serverDhInner is ServerDHInnerData)) {
    throw ('Step 3 answer was ${serverDhInner}');
  }

  if (serverDhInner.nonce != resPQ.nonce) {
    throw new SecurityError('Step 3 Invalid nonce in encrypted answer');
  }
  if (serverDhInner.serverNonce != resPQ.serverNonce) {
    throw new SecurityError('Step 3 Invalid server nonce in encrypted answer');
  }
  final dhPrime = readBigIntFromBuffer(serverDhInner.dhPrime, little: false, signed: false);
  final ga = readBigIntFromBuffer(serverDhInner.gA, little: false, signed: false);
  final timeOffset = serverDhInner.serverTime - (DateTime.now().millisecondsSinceEpoch / 1000).floor();
  final b = readBigIntFromBuffer(generateRandomBytes(256), little: false, signed: false);
  final gb = BigInt.from(serverDhInner.g).modPow(b, dhPrime);
  final gab = ga.modPow(b, dhPrime);

  // Prepare client DH Inner Data
  final clientDhInner = new ClientDHInnerData(
    nonce: resPQ.nonce,
    serverNonce: resPQ.serverNonce,
    retryId: BigInt.zero, // TODO Actual retry ID
    gB: getByteArray(gb, signed: false),
  ).getBytes();

  final clientDdhInnerHashed = [sha1.convert(clientDhInner).bytes, clientDhInner].expand((element) => element).toList();
  // Encryption
  final clientDhEncrypted = IGE.encryptIge(clientDdhInnerHashed, key, iv);
  final DhGenOk dhGen = await sender.send(
    new SetClientDHParams(
      nonce: resPQ.nonce,
      serverNonce: resPQ.serverNonce,
      encryptedData: clientDhEncrypted,
    ),
  );
  final nonceTypes = [DhGenOk, DhGenRetry, DhGenFail];
  if (!(dhGen.runtimeType == nonceTypes[0] || dhGen.runtimeType == nonceTypes[1] || dhGen.runtimeType == nonceTypes[2])) {
    throw ('Step 3.1 answer was ${dhGen}');
  }
  final name = dhGen.runtimeType;
  if (dhGen.nonce != resPQ.nonce) {
    throw new SecurityError('Step 3 invalid ${name} nonce from server');
  }
  if (dhGen.serverNonce != resPQ.serverNonce) {
    throw new SecurityError('Step 3 invalid ${name} server nonce from server');
  }
  final AuthKey authKey = new AuthKey(null, null);

  await authKey.setKey(getByteArray(gab));

  final nonceNumber = 1 + nonceTypes.indexOf(dhGen.runtimeType);

  final newNonceHash = await authKey.calcNewNonceHash(newNonce, nonceNumber);

  final dhHash = dhGen.newNonceHash1;

  if (dhHash != newNonceHash) {
    throw new SecurityError('Step 3 invalid new nonce hash');
  }

  if (!(dhGen is DhGenOk)) {
    throw ('Step 3.2 answer was ${dhGen}');
  }
  log.debug('Finished authKey generation step 3');

  return {"authKey": authKey, "timeOffset": timeOffset};
}
