import '../crypto/IGE.dart';
import '../crypto/auth_key.dart';
import '../extensions/binary_reader.dart';
import '../extensions/binary_writer.dart';
import '../tl/core/GZIP_packed.dart';
import '../tl/core/TLMessage.dart';
import '../utils.dart';
import 'package:crypto/crypto.dart';

class MTProtoState {
  AuthKey authKey;
  var _log,  salt, id, sequence;
  int timeOffset;
  BigInt _lastMsgId;

  /**
   *
      `network.mtprotosender.MTProtoSender` needs to hold a state
      in order to be able to encrypt and decrypt incoming/outgoing messages,
      as well as generating the message IDs. Instances of this class hold
      together all the required information.

      It doesn't make sense to use `tevarhon.sessions.abstract.Session` for
      the sender because the sender should *not* be concerned about storing
      this information to disk, as one may create as many senders as they
      desire to any other data center, or some CDN. Using the same session
      for all these is not a good idea as each need their own authkey, and
      the concept of "copying" sessions with the unnecessary entities or
      updates state for these connections doesn't make sense.

      While it would be possible to have a `MTProtoPlainState` that does no
      encryption so that it was usable through the `MTProtoLayer` and thus
      avoid the need for a `MTProtoPlainSender`, the `MTProtoLayer` is more
      focused to efficiency and this state is also more advanced (since it
      supports gzipping and invoking after other message IDs). There are too
      many methods that would be needed to make it convenient to use for the
      authentication process, at which point the `MTProtoPlainSender` is better
   * @param authKey
   * @param loggers
   */
  MTProtoState(AuthKey authKey, loggers) {
    this.authKey = authKey;
    this._log = loggers;
    this.timeOffset = 0;
    this.salt = BigInt.zero;

    this.id = this.sequence = this._lastMsgId = null;
    this.reset();
  }

  /**
   * Resets the state
   */
  void reset() {
    // Session IDs can be random on every connection
    this.id = generateRandomLong(signed: true);
    this.sequence = 0;
    this._lastMsgId = BigInt.zero;
  }

  /**
   * Updates the message ID to a new one,
   * used when the time offset changed.
   * @param message
   */
  void updateMessageId(message) {
    message.msgId = this.getNewMsgId();
  }

  /**
   * Calculate the key based on Telegram guidelines, specifying whether it's the client or not
   * @param authKey
   * @param msgKey
   * @param client
   * @returns {{iv: Buffer, key: Buffer}}
   */
  List<List<int>> _calcKey(List<int> authKey, List<int> msgKey, bool client) {
    final x = client == true ? 0 : 8;
    final List<int> sha256a = sha256.convert(msgKey + authKey.sublist(x, x + 36)).bytes;
    final List<int> sha256b = sha256.convert(authKey.sublist(x + 40, x + 76) + msgKey).bytes;
    final List<int> key = sha256a.sublist(0, 8) + sha256b.sublist(8, 24) + sha256a.sublist(24, 32);
    final List<int> iv = sha256b.sublist(0, 8) + sha256a.sublist(8, 24) + sha256b.sublist(24, 32);
    return [key, iv];
  }

  /**
   * Writes a message containing the given data into buffer.
   * Returns the message id.
   * @param buffer
   * @param data
   * @param contentRelated
   * @param afterId
   */
  BigInt writeDataAsMessage(BinaryWriter buffer, List<int> data, bool contentRelated, bool afterId) {
    final msgId = this.getNewMsgId();
    final seqNo = this._getSeqNo(contentRelated);
    var body;
    if (afterId!=true) {
      body = GZIPPacked.gzipIfSmaller(contentRelated, data);
    } else {
      throw ("Not needed for now!");
      /*body = await GZIPPacked.gzipIfSmaller(
          contentRelated, new InvokeAfterMsg(afterId, data).getBytes())*/
    }
    final s = readBufferFromBigInt(seqNo, 4, signed: true);
    final b = readBufferFromBigInt(body.length, 4, signed: true);
    final m = toSignedLittleBuffer(msgId, number: 8);
    buffer.write(m + s + b);
    buffer.write(body);
    return msgId;
  }

  /**
   * Encrypts the given message data using the current authorization key
   * following MTProto 2.0 guidelines core.telegram.org/mtproto/description.
   * @param data
   */
  List<int> encryptMessageData(List<int> data) {
    final s = toSignedLittleBuffer(this.salt, number: 8);
    final i = toSignedLittleBuffer(this.id, number: 8);
    data = s + i + data;
    final padding = generateRandomBytes((-(data.length + 12) % 16) + 12);
    // Being substr(what, offset, length); x = 0 for client
    // "msg_key_large = SHA256(substr(auth_key, 88+x, 32) + pt + padding)"
    final List<int> msgKeyLarge = sha256.convert(this.authKey.getKey().sublist(88, 88 + 32) + data + padding).bytes;
    // "msg_key = substr (msg_key_large, 8, 16)"
    final List<int> msgKey = msgKeyLarge.sublist(8, 24);

    final result = this._calcKey(this.authKey.getKey(), msgKey, true);
    final List<int> key = result[0];
    final List<int> iv = result[1];
    final keyId = readBufferFromBigInt(this.authKey.keyId, 8);
    return [keyId, msgKey, IGE.encryptIge(data + padding, key, iv)].expand((element) => element).toList();
  }

  /**
   * Inverse of `encrypt_message_data` for incoming server messages.
   * @param body
   */
  TLMessage decryptMessageData(List<int> body) {
    if (body.length < 8) {
      throw ("Invalid response buffer (too short $body)");
    }

    // TODO Check salt,sessionId, and sequenceNumber
    final BigInt keyId = readBigIntFromBuffer(body.sublist(0, 8));
    if (keyId != this.authKey.keyId) {
      throw ('Server replied with an invalid auth key');
    }

    final msgKey = body.sublist(8, 24);
    final result = this._calcKey(this.authKey.getKey(), msgKey, false);
    final key = result[0];
    final iv = result[1];

    body = IGE.decryptIge(body.sublist(24), key, iv);

    // https://core.telegram.org/mtproto/security_guidelines
    // Sections "checking sha256 hash" and "message length"

    final ourKey = sha256.convert([this.authKey.getKey().sublist(96, 96 + 32), body].expand((element) => element).toList()).bytes;
    if (!eq(msgKey,ourKey.sublist(8, 24))) {
      throw ("Received msg_key doesn't match with expected one");
    }

    final reader = new BinaryReader(body);
    reader.readLong(); // removeSalt
    final serverId = reader.readLong();
    if (serverId != this.id) {
      throw ('Server replied with a wrong session ID');
    }

    final remoteMsgId = reader.readLong();
    final remoteSequence = reader.readInt();
    reader.readInt(); // msgLen for the inner object, padding ignored

    // We could read msg_len bytes and use those in a new reader to read
    // the next TLObject without including the padding, but since the
    // reader isn't used for anything else after this, it's unnecessary.
    final obj = reader.tgReadObject();

    return new TLMessage(remoteMsgId, remoteSequence, obj);
  }

  /**
   * Generates a new unique message ID based on the current
   * time (in ms) since epoch, applying a known time offset.
   * @private
   */
  BigInt getNewMsgId() {
    final now = DateTime.now().millisecondsSinceEpoch / 1000 + this.timeOffset;
    final nanoseconds = ((now - now.floor()) * 1e9).floor();
    var a = BigInt.from(now.floor());
    var c = BigInt.from(nanoseconds);
    var newMsgId = (a<<32) | (c<<2);
    if (this._lastMsgId>=newMsgId) {
      newMsgId = this._lastMsgId + BigInt.from(4);
    }
    this._lastMsgId = newMsgId;
    return newMsgId;

  }

  /**
   * Updates the time offset to the correct
   * one given a known valid message ID.
   * @param correctMsgId {BigInteger}
   */
  int updateTimeOffset(int correctMsgId) {
    final bad = this.getNewMsgId();
    final old = this.timeOffset;
    final now =(DateTime.now().millisecondsSinceEpoch / 1000).floor();
    final correct = correctMsgId >> 32;
    this.timeOffset = correct - now;
    if (this.timeOffset != old) {
      this._lastMsgId = BigInt.zero;
      this._log.debug(
            "Updated time offset (old offset ${old}, bad ${bad}, good ${correctMsgId}, new ${this.timeOffset})",
          );
    }

    return this.timeOffset;
  }

  /**
   * Generates the next sequence number depending on whether
   * it should be for a content-related query or not.
   * @param contentRelated
   * @private
   */
  int _getSeqNo(contentRelated) {
    if (contentRelated) {
      final result = this.sequence * 2 + 1;
      this.sequence += 1;
      return result;
    } else {
      return this.sequence * 2;
    }
  }
}
