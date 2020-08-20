import 'dart:async';

import '../network/MTProto_state.dart';
import '../tl/core/TLMessage.dart';
import '../tl/core/message_container.dart';
import '../utils.dart';
import 'binary_writer.dart';
import 'logger.dart';

class MessagePacker {
  MTProtoState _state;
  List<dynamic> _queue;
  Logger _log;
  Completer<bool> _ready = new Completer<bool>();

  MessagePacker(MTProtoState state, Logger logger) {
    this._state = state;
    this._queue = [];
    this._ready = new Completer<bool>();
    this._log = logger;
  }

  List<dynamic> values() {
    return this._queue;
  }

  void append(state) {
    this._queue.add(state);
    this._ready.complete(true);
  }

  void extend(states) {
    for (final state in states) {
      this._queue.add(state);
    }
    this._ready.complete(true);
  }

  get() async {
    if (this._queue.length == 0) {
      this._ready = new Completer<bool>();
      await this._ready.future;
    }
    if (this._queue.length>0 && this._queue[this._queue.length - 1] == false) {
      this._queue = [];
      return;
    }
    var data;
    BinaryWriter buffer = new BinaryWriter(new List<int>());

    final batch = [];
    var size = 0;

    while (this._queue.length > 0 && batch.length <= MessageContainer.MAXIMUM_LENGTH) {
      final state = this._queue.removeAt(0);
      size += state.data.length + TLMessage.SIZE_OVERHEAD;
      if (size <= MessageContainer.MAXIMUM_SIZE) {
        var afterId;
        if (state.after) {
          afterId = state.after.msgId;
        }
        state.msgId = await this._state.writeDataAsMessage(
              buffer,
              state.data,
              state.request.classType == 'request',
              afterId,
            );
        this._log.debug('Assigned msgId = ${state.msgId} to ${state.request.className || state.request.constructor.name}');
        batch.add(state);
        continue;
      }
      if (batch.length > 0) {
        this._queue.insert(0, state);
        break;
      }
      this._log.warn(
          'Message payload for ${state.request.className || state.request.constructor.name} is too long ${state.data.length} and cannot be sent');
      state.promise.reject('Request Payload is too big');
      size = 0;
      continue;
    }
    if (batch.length == 0) {
      return null;
    }
    if (batch.length > 1) {
      final b =
          [readBufferFromBigInt(MessageContainer.CONSTRUCTOR_ID, 4), readBufferFromBigInt(batch.length, 4)].expand((element) => element);

      data = [b, buffer.getValue()].expand((element) => element);
      buffer = new BinaryWriter(new List());
      final containerId = await this._state.writeDataAsMessage(
            buffer,
            data,
            false,
            false,
          );
      for (final s in batch) {
        s.containerId = containerId;
      }
    }

    data = buffer.getValue();
    return {'batch': batch, 'data': data};
  }
}
