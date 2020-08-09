
import 'dart:io';

import '../../extensions/binary_reader.dart';
import '../../utils.dart';

class GZIPPacked {
  static const CONSTRUCTOR_ID = 0x3072cfa1;
  static const classType = 'constructor';
  List<int> data;
  GZIPPacked(data) {
    this.data = data;
  }

  static Future<List<int>> gzipIfSmaller(contentRelated, data) async {
    if (contentRelated && data.length > 512) {
      final gzipped = await (new GZIPPacked(data)).toBytes();
      if (gzipped.length < data.length) {
        return gzipped;
      }
    }
    return data;
  }

  static List<int> gzip(input) {
    return new GZipCodec(level: 9).encode(input);
    // TODO this usually makes it faster for large requests
    //return Buffer.from(deflate(input, { level: 9, gzip: true }))
  }

  static List<int> ungzip(input) {
    return new GZipCodec().decode(input);

  }

  toBytes() async {
    final g = readBufferFromBigInt(GZIPPacked.CONSTRUCTOR_ID, 4);
    return  g + serializeBytes(await GZIPPacked.gzip(this.data));
  }

  static  read(BinaryReader reader) async {
    final constructor = reader.readInt(signed: false);
    if (constructor != GZIPPacked.CONSTRUCTOR_ID) {
      throw('not equal');
    }
    return await GZIPPacked.gzip(reader.tgReadBytes());
  }

  static fromReader(reader) async {
    return new GZIPPacked(await GZIPPacked.ungzip(reader.tgReadBytes()));
  }
}


