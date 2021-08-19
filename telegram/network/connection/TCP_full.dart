import 'package:crclib/catalog.dart';

import '../../extensions/future_socket.dart';
import '../../utils.dart';
import 'connection.dart';

class FullPacketCodec extends PacketCodec {
  int _sendCounter;

  dynamic tag = null;

  FullPacketCodec(connection) : _sendCounter = 0, super(connection);

  List<int?> encodePacket(List<int> data) {
// https://core.telegram.org/mtproto#tcp-transport
// total length, sequence number, packet and checksum (CRC32)
    final length = data.length + 12;
    final toSend = <int?>[];

    toSend.addAll(readBufferFromBigInt(length, 4, signed: true));

    toSend.addAll(readBufferFromBigInt(this._sendCounter, 4, signed: true));
    toSend.addAll(data);
    toSend.addAll(readBufferFromBigInt(
        Crc32Xz().convert(toSend as List<int>).toBigInt(), 4,
        signed: true));

    this._sendCounter += 1;

    return toSend;
  }

  /**
   *
   * @param reader {PromisedWebSockets}
   * @returns {Promise<*>}
   */
  Future<List<int?>> readPacket(FutureSocket reader) async {
    final packetLenSeq = await reader.readExactly(8); // 4 and 4
// process.exit(0);
    if (packetLenSeq == false) {
      return [];
    }
    final int packetLen =
        readBigIntFromBuffer(packetLenSeq.sublist(0, 4), signed: true).toInt();
    final body = await reader.read(packetLen - 8);

    final int checksum =
        readBigIntFromBuffer(body.sublist(body.length - 4), signed: false)
            .toInt();

    body.removeRange(body.length - 4, body.length);
    packetLenSeq.addAll(body);
    final validChecksum =
        new Crc32Xz().convert(packetLenSeq as List<int>);
    if (!(validChecksum == checksum)) {
      throw ("Invalid checksum (${checksum} when ${validChecksum} was expected). This packet should be skipped.");
    }
    return body;
  }
}

class ConnectionTCPFull extends Connection {
  final dynamic PacketCodecClass = FullPacketCodec;

  ConnectionTCPFull(ip, port, dcId, loggers) : super(ip, port, dcId, loggers);
}
