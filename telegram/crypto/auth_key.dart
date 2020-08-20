import 'package:crypto/crypto.dart';

import '../extensions/binary_reader.dart';
import '../utils.dart';

class AuthKey {
  List<int> _key, _hash;
  BigInt auxHash, keyId;

  AuthKey(value, hash) {
    if (value == null || hash == null) {
      return;
    }
    this._key = value;
    this._hash = hash;
    final reader = BinaryReader(hash);
    this.auxHash = reader.readLong(signed: false);
    reader.read(length: 4);
    this.keyId = reader.readLong(signed: false);
  }

  setKey(value) {
    if (value == null) {
      this.keyId = this.auxHash = this._key = this._hash = null;
      return;
    }
    if (value is AuthKey) {
      this.keyId = value.keyId;
      this.auxHash = value.auxHash;
      this._hash = value._hash;
      this._key = value._key;
      return;
    }
    this._key = value;
    this._hash = sha1
        .convert(this._key)
        .bytes;
    final reader = BinaryReader(this._hash);
    this.auxHash = reader.readLong(signed: false);
    reader.read(length: 4);
    this.keyId = reader.readLong(signed: false);
  }

  getKey() => this._key;

  calcNewNonceHash(newNonce, number) {
    List<int> newNonceList = toSignedLittleBuffer(newNonce, number: 32);
    final n = readBufferFromBigInt(BigInt.from(number), 1);
    final List<int> data = [newNonceList, n, readBufferFromBigInt(this.auxHash, 8, little: true)].expand((element) => element).toList();

    // Calculates the message key from the given data
    final shaData = sha1
        .convert(data)
        .bytes
        .sublist(4, 20);
    return readBigIntFromBuffer(shaData, little: true, signed: true);
  }
  bool operator==(other) =>  other is AuthKey && _key!=null && other.getKey() && other.getKey().equals(this._key);


}
