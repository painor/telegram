import 'dart:async';

class RequestState {
  var containerId, msgId, request, after, result, data;
  Completer? future;
  RequestState(request, {after: null}) {
    this.containerId = null;
    this.msgId = null;
    this.request = request;
    this.data = request.getBytes();
    this.after = after;
    this.result = null;
    this.future = new Completer();
  }
}
