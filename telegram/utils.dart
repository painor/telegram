import 'dart:core';
import 'package:convert/convert.dart';

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

void main() {
  final x =
      readBufferFromBigInt(44454544444444, 8, little: true, signed: false);
  print(x);
  final y = readBigIntFromBuffer(x, little: true, signed: false);
  print(y);
}
