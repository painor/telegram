import 'dart:async';

class AsyncQueue {
  List<List<int>> _queue;
  Completer<bool> canPush = new Completer<bool>();
  Completer<bool> canGet = new Completer<bool>();

  AsyncQueue() {
    this._queue = [];
    this.canPush.complete(true);
  }

  Future<void> push(List<int> value) async{
    await this.canPush.future;
    print("ADDED VALUE");
    this._queue.add(value);
    this.canGet.complete(true);
    this.canPush = new Completer();
  }

  Future<List<int>> pop() async{
    await this.canGet.future;
    print("GETTINBG");
    print(this._queue);
    final List<int> returned = this._queue.removeLast();
    this.canPush.complete(true);
    this.canGet = new Completer<bool>();
    return returned;
  }
}
