class RPCError implements Exception {
  int code;
  String message;
  var request;

  RPCError(message, request, {code: null}) {
    this.code = code;
    this.message = message;
    this.request = request;
  }

  String toString() =>
      'RPCError {0}: {1}{2}'.replaceAll('{0}', code.toString()).replaceAll('{1}', message).replaceAll('{2}', RPCError._fmtRequest(request));

  static _fmtRequest(request) {
// TODO fix this
    if (request) {
      return '(caused by ${request.className})';
    } else {
      return '';
    }
  }
}
