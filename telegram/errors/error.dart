import 'rpc_base_error.dart';

RPCMessageToError(rpcError, request) {
  return new RPCError(rpcError.errorMessage, request);
}
