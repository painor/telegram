import '../../extensions/binary_reader.dart';
import '../constructors/constructors.dart';
import 'GZIP_packed.dart';

class RPCResult {
  static const CONSTRUCTOR_ID = 0xf35c6d01;
  static const classType = "constructor";
  BigInt? reqMsgId;
  var body;
  var error;
  final ID = 0xf35c6d01;
  RPCResult({this.reqMsgId, this.body, this.error});

  static fromReader(BinaryReader reader) {
    final msgId = reader.readLong();
    final innerCode = reader.readInt(signed: false);
    if (innerCode == RpcError.CONSTRUCTOR_ID) {
      return new RPCResult(
          reqMsgId: msgId, body: null, error: RpcError.fromReader(reader));
    }
    if (innerCode == GZIPPacked.CONSTRUCTOR_ID) {
      return new RPCResult(
          reqMsgId: msgId,
          body: GZIPPacked.fromReader(reader).data,
          error: null);
    }
    reader.seek(-4);
// This reader.read() will read more than necessary, but it's okay.
// We could make use of MessageContainer's length here, but since
// it's not necessary we don't need to care about it.
    return new RPCResult(reqMsgId: msgId, body: reader.read(), error: null);
  }

  @override
  String toString() {
    return "RPCResult : reqMsgId : $reqMsgId,body : $body, error : ${error?.toString()}";
  }
}
