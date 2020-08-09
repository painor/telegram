import 'dart:convert';
import 'dart:core';
import 'dart:math';
import 'package:convert/convert.dart';
import 'package:crclib/crclib.dart';

BigInt readBigIntFromBuffer(List<int> buffer, {little: true, signed: false}) {
  final bytesNumber = buffer.length;
  if (little) {
    buffer = buffer.reversed.toList();
  }
  BigInt bigInt = BigInt.parse(hex.encode(buffer), radix: 16);
  if (signed && (bigInt.toRadixString(2).length / 8).floor() >= bytesNumber) {
    BigInt lesser = BigInt.two.pow(bytesNumber * 8);
    bigInt = bigInt - lesser;
  }
  return bigInt;
}

List<int> readBufferFromBigInt(bigInt, int bytesNumber,
    {bool little: true, bool signed: false}) {
  bigInt = new BigInt.from(bigInt);
  final bitLength = bigInt.bitLength;
  final bytes = (bitLength / 8).ceil();
  if (bytesNumber < bytes) {
    throw ('OverflowError: int too big to convert');
  }
  if (!signed && bigInt < BigInt.zero) {
    throw ('Cannot convert to unsigned');
  }
  var below = false;
  if (bigInt < BigInt.zero) {
    below = true;
    bigInt = bigInt.abs();
  }

  final hexNumber = bigInt.toRadixString(16).padLeft(bytesNumber * 2, '0');
  var buffer = hex.decode(hexNumber);
  if (little) {
    buffer = buffer.reversed.toList();
  }

  if (signed && below) {
    if (little) {
      var reminder = false;
      if (buffer[0] != 0) {
        buffer[0] -= 1;
      }
      for (var i = 0; i < buffer.length; i++) {
        if (buffer[i] == 0) {
          reminder = true;
          continue;
        }
        if (reminder) {
          buffer[i] -= 1;
          reminder = false;
        }
        buffer[i] = 255 - buffer[i];
      }
    } else {
      buffer[buffer.length - 1] = 256 - buffer[buffer.length - 1];
      for (var i = 0; i < buffer.length - 1; i++) {
        buffer[i] = 255 - buffer[i];
      }
    }
  }
  return buffer;
}

List<int> generateRandomBytes(int count) {
  Random random = Random.secure();

  return List<int>.generate(count, (i) => random.nextInt(256));
}

BigInt generateRandomLong({signed: true}) {
  return readBigIntFromBuffer(generateRandomBytes(8),
      little: true, signed: signed);
}

List<int> serializeBytes(data) {
  if (!(data is List<int>)) {
    if (data is String) {
      data = utf8.decode(data);
    } else {
      throw("Bytes or str expected, not ${data.constructor.name}");
    }
  }
  const r = [];
  int padding;
  if (data.length < 254) {
    padding = (data.length + 1) % 4;
    if (padding != 0) {
      padding = 4 - padding;
    }
    r.add([data.length]);
    r.add(data);
  } else {
    padding = data.length % 4;
    if (padding != 0) {
      padding = 4 - padding;
    }
    r.add([254, data.length % 256+(data.length >> 8) % 256+(data.length >> 16) % 256]);
    r.add(data);
  }
  final s = new List(padding);
  s.fillRange(0,padding,0);
  r.add(s);

  return r.expand((element) => element).toList();

}

void main() {
  final x = new Crc32Zlib().convert([1, 2, 3]);
  print(x);
}
