
 RPCMessageToError(rpcError, request) {
  return new RPCError(rpcError.errorMessage, request);
}
