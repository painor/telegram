import 'dart:mirrors';
import "dart:collection";

import '../../extensions/async_queue.dart';
import '../../extensions/future_socket.dart';

final queue = Queue<String>();
/**
 *
 * Subclasses will implement different transport modes as atomic operations,
 * which this class eases doing since the exposed interface simply puts and
 * gets complete data payloads to and from queues.
 *
 * The only error that will raise from send and receive methods is
 * ``ConnectionError``, which will raise when attempting to send if
 * the client is disconnected (includes remote disconnections).
 */
class Connection {
  var PacketCodecClass;
  var _ip,_port,_dcId,_log,_connected,_sendTask,_recvTask,_codec,
  _obfuscation;
  AsyncQueue _sendArray,_recvArray;
  FutureSocket socket;
  Connection(ip, port, dcId, loggers) {
    this._ip = ip;
    this._port = port;
    this._dcId = dcId;
    this._log = loggers;
    this._connected = false;
    this._sendTask = null;
    this._recvTask = null;
    this._codec = null;
    this._obfuscation = null; // TcpObfuscated and MTProxy
    this._sendArray =  new AsyncQueue();
    this._recvArray = new AsyncQueue();
    //this.socket = new PromiseSocket(new Socket())

    this.socket = new FutureSocket();
  }

  void _connect() async {
    this._log.debug('Connecting');
    this._codec = reflectClass(this.PacketCodecClass).newInstance(new  Symbol(''), []);
    await this.socket.connect(this._ip, this._port);
    this._log.debug('Finished connecting');
    // await this.socket.connect({host: this._ip, port: this._port});
    await this._initConn();
  }
  connect() async{
    await this._connect();
    this._connected = true;

    if (!this._sendTask) {
      this._sendTask = this._sendLoop();
    }
    this._recvTask = this._recvLoop();
  }

  disconnect() async{
    this._connected = false;
    await this._recvArray.push(null);
    await this.socket.close();
  }

  send(data) async{
    if (!this._connected) {
      throw('Not connected');
    }
    await this._sendArray.push(data);
  }


  recv() async{
    while (this._connected) {
      final List<int> result = await this._recvArray.pop();
      // null = sentinel value = keep trying
      if (result.length!=0) {
        return result;
      }
    }
    throw('Not connected');
  }

  _sendLoop() async{
    // TODO handle errors
    try {
      while (this._connected) {
        final data = await this._sendArray.pop();
        if (data.length==0) {
          this._sendTask = null;
          return;
        }
        await this._send(data);
      }
    } catch (e) {
      this._log.info('The server closed the connection while sending');
    }
  }

  _recvLoop() async{
    var data;
    while (this._connected) {
      try {
        data = await this._recv();
        if (!data) {
          throw("no data received");
        }
      } catch (e) {
        this._log.info('connection closed');
        //await this._recvArray.push()

        this.disconnect();
        return;
      }
      await this._recvArray.push(data);
    }
  }
  _initConn() async {
    if (this._codec.tag) {
      await this.socket.write(this._codec.tag);
    }
  }

  _send(data) async {
    final encodedPacket = this._codec.encodePacket(data);
    this.socket.write(encodedPacket);
  }

  _recv() async {
    return await this._codec.readPacket(this.socket);
  }

  toString() {
    return "${this._ip}:${this._port}/${this.runtimeType.toString().replaceAll('Connection', '')}";
  }
}

class ObfuscatedConnection extends Connection {
  var ObfuscatedIO = null;

  ObfuscatedConnection(ip, port, dcId, loggers) : super(ip, port, dcId, loggers);

  _initConn() async{
    this._obfuscation = reflectClass(this.PacketCodecClass).newInstance(new  Symbol(''), []);
    this.socket.write(this._obfuscation.header);
  }

  _send(data) {
    this._obfuscation.write(this._codec.encodePacket(data));
  }


   _recv() async{
    return await this._codec.readPacket(this._obfuscation);
  }
}

class PacketCodec {
  var _conn;
  PacketCodec(connection) {
    this._conn = connection;
  }

  List<int> encodePacket(List<int> data) {
    throw('Not Implemented');

    // Override
  }

  Future<List<int>> readPacket(FutureSocket reader) async {
    // override
    throw('Not Implemented');
  }
}


