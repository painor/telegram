import 'dart:convert';
import 'dart:typed_data';

import '../tl/all_tl_objects.dart';
import '../tl/core/core.dart';
import '../utils.dart';

class BinaryReader {
  final List<int> stream;
  int offset = 0;

  BinaryReader(List<int> this.stream);

  // region Reading

  // "All numbers are written as little endian."
  // https://core.telegram.org/mtproto
  /**
   * Reads a single byte value.
   */
  int readByte() {
    return this.read(length: 1)[0];
  }

  /**
   * Reads an integer (4 bytes or 32 bits) value.
   * @param signed {Boolean}
   */
  int readInt({bool signed: true}) {
    final res = readBigIntFromBuffer(
        this.stream.sublist(this.offset, this.offset + 4), signed: signed);
    this.offset += 4;
    return res.toInt();
  }

  /**
   * Reads a long integer (8 bytes or 64 bits) value.
   * @param signed
   * @returns {BigInteger}
   */
  BigInt readLong({bool signed :true}) {
    return this.readLargeInt(64, signed:signed);
  }

  /**
   * Reads a n-bits long integer value.
   * @param bits
   * @param signed {Boolean}
   */
  BigInt readLargeInt(int bits, {bool signed=true}) {
    final buffer = this.read(length:(bits / 8).floor());
    return readBigIntFromBuffer(buffer, little: true, signed: signed);
  }

  /**
   * Read the given amount of bytes, or -1 to read all remaining.
   * @param length {number}
   */
  List<int> read({length:-1}) {
    if (length == -1) {
      length = this.stream.length - this.offset;
    }
    final result = this.stream.sublist(this.offset, this.offset + length);
    this.offset += length;
    if (result.length != length) {
      throw("No more data left to read (need ${length}, got ${result
          .length}: ${result});");
    }
    return result;
  }

  /**
   * Gets the byte array representing the current buffer as a whole.
   * @returns {Buffer}
   */
  List<int> getBuffer() {
    return this.stream;
  }

  // endregion

  // region Telegram custom reading
  /**
   * Reads a Telegram-encoded byte array, without the need of
   * specifying its length.
   * @returns {Buffer}
   */
  List<int> tgReadBytes() {
    final firstByte = this.readByte();
    var padding;
    var length;
    if (firstByte == 254) {
      length =
      this.readByte() | (this.readByte() << 8) | (this.readByte() << 16);
      padding = length % 4;
    } else {
      length = firstByte;
      padding = (length + 1) % 4;
    }
    final data = this.read(length: length);

    if (padding > 0) {
      padding = 4 - padding;
      this.read(length: padding);
    }

    return data;
  }

  /**
   * Reads a Telegram-encoded string.
   * @returns {string}
   */
  String tgReadString() {
    return utf8.decode(this.tgReadBytes());
  }

  /**
   * Reads a Telegram boolean value.
   * @returns {boolean}
   */

  bool tgReadBool() {
    final int value = this.readInt(signed: false);
    if (value == 0x997275b5) {
      // boolTrue
      return true;
    } else if (value == 0xbc799737) {
      // boolFalse
      return false;
    } else {
      throw("Invalid boolean code ${value.toRadixString(16)}");
    }
  }

  /**
   * Reads and converts Unix time (used by Telegram)
   * into a Javascript {Date} object.
   * @returns {Date}
   */
  DateTime tgReadDate() {
    final int value = this.readInt();
    return new DateTime.fromMillisecondsSinceEpoch(value * 1000);
  }

  /**
   * Reads a real floating point (8 bytes) value.
   * @returns {BigInteger}
   */
  readDouble() {

    // was this a bug ? it should have been <d
    return ByteData.sublistView(Uint8List.fromList(this.read(length: 8))).getFloat64(0,Endian.little);
  }
  /**
   * Reads a Telegram object.
   */
  dynamic tgReadObject() {
    final constructorId = this.readInt(signed: false);
    var clazz = tlobjects[constructorId];
    if (clazz == null) {
      /**
       * The class was None, but there's still a
       * chance of it being a manually parsed value like bool!
       */
      final value = constructorId;
      if (value == 0x997275b5) {
        // boolTrue
        return true;
      } else if (value == 0xbc799737) {
        // boolFalse
        return false;
      } else if (value == 0x1cb5c415) {
        // Vector
        final temp = [];
        final length = this.readInt();
        for (var i = 0; i < length; i++) {
          temp.add(this.tgReadObject());
        }
        return temp;
      }

      clazz = coreObjects[constructorId];

      if (clazz == null) {
        // If there was still no luck, give up
        this.seek(-4); // Go back
        final pos = this.tellPosition();
        final error = new Error();
        this.setPosition(pos);
        throw error;
      }
    }
    return clazz.fromReader(this);
  }

  /**
   * Reads a vector (a list) of Telegram objects.
   * @returns {[Buffer]}
   */
  List<dynamic> tgReadVector() {
    if (this.readInt(signed: false) != 0x1cb5c415) {
      throw('Invalid constructor code, vector was expected');
    }
    final count = this.readInt();
    final temp = [];
    for (var i = 0; i < count; i++) {
      temp.add(this.tgReadObject());
    }
    return temp;
  }

  // endregion

  /**
   * Closes the reader.
   */
  void close() {
    this.stream.clear();
  }

  // region Position related

  /**
   * Tells the current position on the stream.
   * @returns {number}
   */
  int tellPosition() {
    return this.offset;
  }

  /**
   * Sets the current position on the stream.
   * @param position
   */
  void setPosition(position) {
    this.offset = position;
  }

  /**
   * Seeks the stream position given an offset from the current position.
   * The offset may be negative.
   * @param offset
   */
  void seek(offset) {
    this.offset += offset;
  }

// endregion
}
