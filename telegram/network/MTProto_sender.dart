import '../crypto/auth_key.dart';
import '../errors/common.dart';
import '../errors/error.dart';
import '../extensions/binary_reader.dart';
import '../extensions/logger.dart';
import '../extensions/message_packer.dart';
import '../tl/core/GZIP_packed.dart';
import '../tl/core/RPC_result.dart';
import '../tl/core/message_container.dart';
import '../utils.dart';
import 'MTProto_plain_sender.dart';
import 'MTProto_state.dart';
import 'authenticator.dart';
import 'connection/connection.dart';
import '../tl/constructors/constructors.dart';
import 'request_state.dart';
import '../tl/constructors/upload.dart';
import '../tl/requests/auth.dart';

/**
 * MTProto Mobile Protocol sender
 * (https://core.telegram.org/mtproto/description)
 * This class is responsible for wrapping requests into 'TLMessage''s,
 * sending them over the network and receiving them in a safe manner.
 *
 * Automatic reconnection due to temporary network issues is a concern
 * for this class as well, including retry of messages that could not
 * be sent successfully.
 *
 * A new authorization key will be generated on connection if no other
 * key exists yet.
 */
class MTProtoSender {
  Map<int, dynamic> _handlers;
  Set _pendingAck;
  List _lastAcks;
  MessagePacker _sendQueue;
  Map<int, dynamic> _pendingState;
  MTProtoState _state;
  Logger _log;
  AuthKey authKey;
  Connection _connection;
  bool _userConnected, _reconnecting, _disconnected;
  var _sendLoopHandle, _recvLoopHandle, _autoReconnectCallback;
  int _retries, _delay, _dcId;
  dynamic _authKeyCallback, _updateCallback;

  /**
   * @param authKey
   * @param opts
   */
  MTProtoSender(authKey,
      {updateCallback: null, autoReconnectCallback: null, dcId: null, log: null, retries: 10, delay: 2, authKeyCallback: null}) {
    _log = log;
    _dcId = dcId;
    _autoReconnectCallback = autoReconnectCallback;
    _authKeyCallback = authKeyCallback;
    _retries = retries;
    _delay = delay;
    _updateCallback = updateCallback;
    this._connection = null;
    /**
     * Whether the user has explicitly connected or disconnected.
     *
     * If a disconnection happens for any other reason and it
     * was *not* user action then the pending messages won't
     * be cleared but on explicit user disconnection all the
     * pending futures should be cancelled.
     */
    this._userConnected = false;
    this._reconnecting = false;
    this._disconnected = true;

    /**
     * We need to join the loops upon disconnection
     */
    this._sendLoopHandle = null;
    this._recvLoopHandle = null;

    /**
     * Preserving the references of the AuthKey and state is important
     */
    this.authKey = authKey ?? new AuthKey(null, null);
    this._state = new MTProtoState(this.authKey, this._log);

    /**
     * Outgoing messages are put in a queue and sent in a batch.
     * Note that here we're also storing their ''_RequestState''.
     */
    this._sendQueue = new MessagePacker(this._state, this._log);

    /**
     * Sent states are remembered until a response is received.
     */
    this._pendingState = {};

    /**
     * Responses must be acknowledged, and we can also batch these.
     */
    this._pendingAck = new Set();

    /**
     * Similar to pending_messages but only for the last acknowledges.
     * These can't go in pending_messages because no acknowledge for them
     * is received, but we may still need to resend their state on bad salts.
     */
    this._lastAcks = [];

    /**
     * Jump table from response ID to method that handles it
     */

    this._handlers = {
      RPCResult.CONSTRUCTOR_ID: this._handleRPCResult,
      MessageContainer.CONSTRUCTOR_ID: this._handleContainer,
      GZIPPacked.CONSTRUCTOR_ID: this._handleGzipPacked,
      Pong.CONSTRUCTOR_ID: this._handlePong,
      BadServerSalt.CONSTRUCTOR_ID: this._handleBadServerSalt,
      BadMsgNotification.CONSTRUCTOR_ID: this._handleBadNotification,
      MsgDetailedInfo.CONSTRUCTOR_ID: this._handleDetailedInfo,
      MsgNewDetailedInfo.CONSTRUCTOR_ID: this._handleNewDetailedInfo,
      NewSessionCreated.CONSTRUCTOR_ID: this._handleNewSessionCreated,
      MsgsAck.CONSTRUCTOR_ID: this._handleAck,
      FutureSalts.CONSTRUCTOR_ID: this._handleFutureSalts,
      MsgsStateReq.CONSTRUCTOR_ID: this._handleStateForgotten,
      MsgResendReq.CONSTRUCTOR_ID: this._handleStateForgotten,
      MsgsAllInfo.CONSTRUCTOR_ID: this._handleMsgAll,
    };
  }

// Public API

  /**
   * Connects to the specified given connection using the given auth key.
   * @param connection
   * @param eventDispatch {function}
   * @returns {Promise<boolean>}
   */
  connect(connection, {eventDispatch: null}) async {
    if (this._userConnected) {
      this._log.info('User is already connected!');
      return false;
    }
    this._connection = connection;

    final retries = this._retries;

    for (var attempt = 0; attempt < retries; attempt++) {
      try {
        await this._connect();
        break;
      } catch (e) {
        /*if (attempt===0 && eventDispatch!=null) {
          eventDispatch({ update: new UpdateConnectionState(-1)});
        }
        this._log.error("WebSocket connection failed attempt : " + (attempt + 1))*/
        await asyncSleep(this._delay);
      }
    }
    return true;
  }

  bool isConnected() {
    return this._userConnected;
  }

  /**
   * Cleanly disconnects the instance from the network, cancels
   * all pending requests, and closes the send and receive loops.
   */
  disconnect() async {
    await this._disconnect();
  }

  /**
   *
      This method enqueues the given request to be sent. Its send
      state will be saved until a response arrives, and a ''Future''
      that will be resolved when the response arrives will be returned:

      .. code-block:: javascript

      async def method():
      # Sending (enqueued for the send loop)
      future = sender.send(request)
      # Receiving (waits for the receive loop to read the result)
      result = await future

      Designed like this because Telegram may send the response at
      any point, and it can send other items while one waits for it.
      Once the response for this future arrives, it is set with the
      received result, quite similar to how a ''receive()'' call
      would otherwise work.

      Since the receiving part is "built in" the future, it's
      impossible to await receive a result that was never sent.
   * @param request
   * @returns {RequestState}
   */
  send(request) {
    if (!this._userConnected) {
      throw('Cannot send requests while disconnected');
    }
//CONTEST
    final state = new RequestState(request);
    this._sendQueue.append(state);
    return state.future;
/*
        if (!Helpers.isArrayLike(request)) {
            final state = new RequestState(request)
            this._sendQueue.append(state)
            return state.promise
        } else {
            throw new Error('not supported')
        }*/
  }

  /**
   * Performs the actual connection, retrying, generating the
   * authorization key if necessary, and starting the send and
   * receive loops.
   * @returns {Promise<void>}
   * @private
   */
  _connect() async {
    this._log.info('Connecting to ${this._connection}...');
    await this._connection.connect();
    this._log.debug('Connection success!');
//process.exit(0)
    if (!this.authKey.getKey()) {
      final plain = new MTProtoPlainSender(this._connection, this._log);
      this._log.debug('New auth_key attempt ...');
      final res = await doAuthentication(plain, this._log);
      this._log.debug('Generated new auth_key successfully');
      await this.authKey.setKey(res.authKey);

      this._state.timeOffset = res.timeOffset;

      /**
       * This is *EXTREMELY* important since we don't control
       * external references to the authorization key, we must
       * notify whenever we change it. This is crucial when we
       * switch to different data centers.
       */
      if (this._authKeyCallback) {
        await this._authKeyCallback(this.authKey, this._dcId);
      }
    } else {
      this._log.debug('Already have an auth key ...');
    }
    this._userConnected = true;
    this._reconnecting = false;

    this._log.debug('Starting send loop');
    this._sendLoopHandle = this._sendLoop();

    this._log.debug('Starting receive loop');
    this._recvLoopHandle = this._recvLoop();

// _disconnected only completes after manual disconnection
// or errors after which the sender cannot continue such
// as failing to reconnect or any unexpected error.

    this._log.info('Connection to ${this._connection.toString()} complete!');
  }

  _disconnect
      ({error: null}) async {
    if (this._connection == null) {
      this._log.info('Not disconnecting (already have no connection)');
      return;
    }
    /* if (this._updateCallback){
  this._updateCallback(-1)
  }*/
    this._log.info('Disconnecting from ${this._connection.toString()}...');
    this._userConnected = false;
    this._log.debug('Closing current connection...');
    await this._connection.disconnect();
  }

  /**
   * This loop is responsible for popping items off the send
   * queue, encrypting them, and sending them over the network.
   * Besides 'connect', only this method ever sends data.
   * @returns {Promise<void>}
   * @private
   */
  _sendLoop() async {
    this._sendQueue = new MessagePacker(this._state, this._log);

    while (this._userConnected && !this._reconnecting) {
      if (this._pendingAck.length > 0) {
        final ack = new RequestState(new MsgsAck(msgIds: this._pendingAck.expand((element) => element)));
        this._sendQueue.append(ack);
        this._lastAcks.add(ack);
        this._pendingAck.clear();
      }
      this._log.debug('Waiting for messages to send...${this._reconnecting}');
// TODO Wait for the connection send queue to be empty?
// This means that while it's not empty we can wait for
// more messages to be added to the send queue.
      final res = await this._sendQueue.get();

      if (this._reconnecting) {
        return;
      }

      if (!res) {
        continue;
      }
      var data = res.data;
      final batch = res.batch;
      this._log.debug('Encrypting ${batch.length} message(s) in ${data.length}  bytes for sending');
      data = await this._state.encryptMessageData(data);

      try {
        await this._connection.send(data);
      } catch (e) {
        this._log.error(e);
        this._log.info('Connection closed while sending data');
        return;
      }
      for (final state in batch) {
        if (!state.runtimeType == Iterable) {
          if (state.request.classType == 'request') {
            this._pendingState[state.msgId] = state;
          }
        } else {
          for (final s in state) {
            if (s.request.classType == 'request') {
              this._pendingState[s.msgId] = s;
            }
          }
        }
      }
      this._log.debug('Encrypted messages put in a queue to be sent');
    }
  }

  _recvLoop() async {
    var body;
    var message;

    while (this._userConnected && !this._reconnecting) {
// this._log.debug('Receiving items from the network...');
      this._log.debug('Receiving items from the network...');
      try {
        body = await this._connection.recv();
      } catch (e) {
// this._log.info('Connection closed while receiving data');
        this._log.warn('Connection closed while receiving data');
        this._startReconnect();
        return;
      }
      try {
        message = await this._state.decryptMessageData(body);
      } catch (e) {
        if (e is TypeNotFoundError) {
// Received object which we don't know how to deserialize
          this._log.info('Type ${e.invalidConstructorId} not found, remaining data ${e.remaining}');
          continue;
        } else if (e is SecurityError) {
// A step while decoding had the incorrect data. This message
// should not be considered safe and it should be ignored.
          this._log.warn('Security error while unpacking a received message: ${e}');
          continue;
        } else if (e is InvalidBufferError) {
          /*
          this._log.info('Broken authorization key; resetting');
          if (this._updateCallback && this._isMainSender) {
// 0 == broken
            this._updateCallback(0)
          } else if (this._senderCallback && !this._isMainSender) {
// Deletes the current sender from the object
            this._senderCallback(this._dcId)
          }*/

// We don't really need to do this if we're going to sign in again
/*await this.authKey.setKey(null)

                    if (this._authKeyCallback) {
                        await this._authKeyCallback(null)
                    }*/
// We can disconnect at sign in
/* await this.disconnect()
                    */ ;
          return;
        } else {
          this._log.error('Unhandled error while receiving data');
          this._log.error(e);
          this._startReconnect();
          return;
        }
      }
      try {
        await this._processMessage(message);
      } catch (e) {
        this._log.error('Unhandled error while receiving data');
        this._log.error(e);
      }
    }
  }

// Response Handlers

  /**
   * Adds the given message to the list of messages that must be
   * acknowledged and dispatches control to different ''_handle_*''
   * method based on its type.
   * @param message
   * @returns {Promise<void>}
   * @private
   */
  _processMessage(message) async {
    this._pendingAck.add(message.msgId);
// eslint-disable-next-line require-atomic-updates
    message.obj = await message.obj;
    var handler = this._handlers[message.obj.CONSTRUCTOR_ID];
    if (!handler) {
      handler = this._handleUpdate;
    }

    await handler(message);
  }

  /**
   * Pops the states known to match the given ID from pending messages.
   * This method should be used when the response isn't specific.
   * @param msgId
   * @returns {*[]}
   * @private
   */
  _popStates(msgId) {
    var state = this._pendingState[msgId];
    if (state) {
      this._pendingState.remove(msgId);
      return [state];
    }

    final toPop = [];

    for (state in this._pendingState.values) {
      if (state.containerId.equals(msgId)) {
        toPop.add(state.msgId);
      }
    }

    if (toPop.length > 0) {
      final temp = [];
      for (final x in toPop) {
        temp.add(this._pendingState[x]);
        this._pendingState.remove(x);
      }
      return temp;
    }

    for (final ack in this._lastAcks) {
      if (ack.msgId == msgId) {
        return [ack];
      }
    }

    return [];
  }

  /**
   * Handles the result for Remote Procedure Calls:
   * rpc_result#f35c6d01 req_msg_id:long result:bytes = RpcResult;
   * This is where the future results for sent requests are set.
   * @param message
   * @returns {Promise<void>}
   * @private
   */
  _handleRPCResult(message) {
    final RPCResult = message.obj;
    final state = this._pendingState[RPCResult.reqMsgId];
    if (state) {
      this._pendingState.remove([RPCResult.reqMsgId]);
    }
    this._log.debug('Handling RPC result for message ${RPCResult.reqMsgId}');

    if (!state) {
// TODO We should not get responses to things we never sent
// However receiving a File() with empty bytes is "common".
// See #658, #759 and #958. They seem to happen in a container
// which contain the real response right after.
      try {
        final BinaryReader reader = new BinaryReader(RPCResult.body);
        if (!(reader.tgReadObject() is File)) {
          throw('Not an upload.File');
        }
      } catch (e) {
        this._log.error(e);
        if (e is TypeNotFoundError) {
          this._log.info('Received response without parent request: ${RPCResult.body}');
          return;
        } else {
          throw e;
        }
      }
    }
    if (RPCResult.error) {
// eslint-disable-next-line new-cap
      final error = RPCMessageToError(RPCResult.error, state.request);
      this._sendQueue.append(new RequestState(new MsgsAck(msgIds: [state.msgId])));
      state.reject(error);
    } else {
      final reader = new BinaryReader(RPCResult.body);
      final read = state.request.readResult(reader);
      state.resolve(read);
    }
  }

  /**
   * Processes the inner messages of a container with many of them:
   * msg_container#73f1f8dc messages:vector<%Message> = MessageContainer;
   * @param message
   * @returns {Promise<void>}
   * @private
   */
  _handleContainer(message) async {
    this._log.debug('Handling container');
    for (final innerMessage in message.obj.messages) {
      await this._processMessage(innerMessage);
    }
  }

  /**
   * Unpacks the data from a gzipped object and processes it:
   * gzip_packed#3072cfa1 packed_data:bytes = Object;
   * @param message
   * @returns {Promise<void>}
   * @private
   */
  _handleGzipPacked(message) async {
    this._log.debug('Handling gzipped data');
    final reader = new BinaryReader(message.obj.data);
    message.obj = reader.tgReadObject();
    await this._processMessage(message);
  }

  _handleUpdate(message) async {
    if (message.obj.SUBCLASS_OF_ID != 0x8af52aac) {
// crc32(b'Updates')
      this._log.warn('Note: ${message.obj.className} is not an update, not dispatching it');
      return;
    }
    this._log.debug('Handling update ' + message.obj.className);
    if (this._updateCallback) {
      this._updateCallback(message.obj);
    }
  }

  /**
   * Handles pong results, which don't come inside a ''RPCResult''
   * but are still sent through a request:
   * pong#347773c5 msg_id:long ping_id:long = Pong;
   * @param message
   * @returns {Promise<void>}
   * @private
   */
  _handlePong(message) async {
    final pong = message.obj;
    this._log.debug('Handling pong for message ${pong.msgId}');
    final state = this._pendingState[pong.msgId];
    this._pendingState.remove(pong.msgId);

// Todo Check result
    if (state) {
      state.resolve(pong);
    }
  }

  /**
   * Corrects the currently used server salt to use the right value
   * before enqueuing the rejected message to be re-sent:
   * bad_server_salt#edab447b bad_msg_id:long bad_msg_seqno:int
   * error_code:int new_server_salt:long = BadMsgNotification;
   * @param message
   * @returns {Promise<void>}
   * @private
   */
  _handleBadServerSalt(message) async {
    final badSalt = message.obj;
    this._log.debug('Handling bad salt for message ${badSalt.badMsgId}');
    this._state.salt = badSalt.newServerSalt;
    final states = this._popStates(badSalt.badMsgId);
    this._sendQueue.extend(states);
    this._log.debug('${states.length} message(s)        will be resent');
  }

  /**
   * Adjusts the current state to be correct based on the
   * received bad message notification whenever possible:
   * bad_msg_notification#a7eff811 bad_msg_id:long bad_msg_seqno:int
   * error_code:int = BadMsgNotification;
   * @param message
   * @returns {Promise<void>}
   * @private
   */
  _handleBadNotification(message) async {
    final badMsg = message.obj;
    final states = this._popStates(badMsg.badMsgId);
    this._log.debug('Handling bad msg ${badMsg}');
    if ([16, 17].contains(badMsg.errorCode)) {
// Sent msg_id too low or too high (respectively).
// Use the current msg_id to determine the right time offset.
      final to = this._state.updateTimeOffset(message.msgId);
      this._log.info('System clock is wrong, set time offset to ${to}s');
    } else if (badMsg.errorCode == 32) {
// msg_seqno too low, so just pump it up by some "large" amount
// TODO A better fix would be to start with a new fresh session ID
      this._state.sequence += 64;
    } else if (badMsg.errorCode == 33) {
// msg_seqno too high never seems to happen but just in case
      this._state.sequence -= 16;
    } else {
      for (final state in states) {
        state.reject(new BadMessageError(state.request, badMsg.errorCode));
      }

      return;
    }
// Messages are to be re-sent once we've corrected the issue
    this._sendQueue.extend(states);
    this._log.debug('${states.length} messages will be resent due to bad msg');
  }

  /**
   * Updates the current status with the received detailed information:
   * msg_detailed_info#276d3ec6 msg_id:long answer_msg_id:long
   * bytes:int status:int = MsgDetailedInfo;
   * @param message
   * @returns {Promise<void>}
   * @private
   */
  _handleDetailedInfo(message) async {
// TODO https://goo.gl/VvpCC6
    final msgId = message.obj.answerMsgId;
    this._log.debug('Handling detailed info for message ${msgId}');
    this._pendingAck.add(msgId);
  }

  /**
   * Updates the current status with the received detailed information:
   * msg_new_detailed_info#809db6df answer_msg_id:long
   * bytes:int status:int = MsgDetailedInfo;
   * @param message
   * @returns {Promise<void>}
   * @private
   */
  _handleNewDetailedInfo(message) async {
// TODO https://goo.gl/VvpCC6
    final msgId = message.obj.answerMsgId;
    this._log.debug('Handling new detailed info for message ${msgId}');
    this._pendingAck.add(msgId);
  }

  /**
   * Updates the current status with the received session information:
   * new_session_created#9ec20908 first_msg_id:long unique_id:long
   * server_salt:long = NewSession;
   * @param message
   * @returns {Promise<void>}
   * @private
   */
  _handleNewSessionCreated(message) async {
// TODO https://goo.gl/LMyN7A
    this._log.debug('Handling new session created');
    this._state.salt = message.obj.serverSalt;
  }

  /**
   * Handles a server acknowledge about our messages. Normally
   * these can be ignored except in the case of ''auth.logOut'':
   *
   *     auth.logOut#5717da40 = Bool;
   *
   * Telegram doesn't seem to send its result so we need to confirm
   * it manually. No other request is known to have this behaviour.

   * Since the ID of sent messages consisting of a container is
   * never returned (unless on a bad notification), this method
   * also removes containers messages when any of their inner
   * messages are acknowledged.

   * @param message
   * @returns {Promise<void>}
   * @private
   */
  _handleAck(message) async {
    final ack = message.obj;
    this._log.debug('Handling acknowledge for ${ack.msgIds}');
    for (final msgId in ack.msgIds) {
      final state = this._pendingState[msgId];
      if (state && state.request is LogOut) {
        this._pendingState.remove(msgId);
        state.resolve(true);
      }
    }
  }

  /**
   * Handles future salt results, which don't come inside a
   * ''rpc_result'' but are still sent through a request:
   *     future_salts#ae500895 req_msg_id:long now:int
   *     salts:vector<future_salt> = FutureSalts;
   * @param message
   * @returns {Promise<void>}
   * @private
   */
  _handleFutureSalts(message) async {
// TODO save these salts and automatically adjust to the
// correct one whenever the salt in use expires.
    this._log.debug('Handling future salts for message ${message.msgId}');
    final state = this._pendingState[message.msgId];

    if (state) {
      this._pendingState.remove(message);
      state.resolve(message.obj);
    }
  }

  /**
   * Handles both :tl:'MsgsStateReq' and :tl:'MsgResendReq' by
   * enqueuing a :tl:'MsgsStateInfo' to be sent at a later point.
   * @param message
   * @returns {Promise<void>}
   * @private
   */
  _handleStateForgotten(message) async {
    this._sendQueue.append(
      new RequestState(new MsgsStateInfo(reqMsgId: message.msgId, info: String.fromCharCode(1) * message.obj.msgIds)),
    );
  }

  /**
   * Handles :tl:'MsgsAllInfo' by doing nothing (yet).
   * @param message
   * @returns {Promise<void>}
   * @private
   */
  _handleMsgAll(message) async {
  }

  _startReconnect() async {
    if (this._userConnected && !this._reconnecting) {
      this._reconnecting = true;
// TODO Should we set this?
// this._user_connected = false
      this._log.info("Started reconnecting");
      this._reconnect();
    }
  }

  _reconnect() async {
    this._log.debug('Closing current connection...');
    try {
      await this.disconnect();
    } catch (err) {
      this._log.warn(err);
    }
    this._sendQueue.append(null);

    this._state.reset();
    final retries = this._retries;


    for (var attempt = 0; attempt < retries; attempt++) {
      try {
        await this._connect();
// uncomment this if you want to resend
//this._sendQueue.extend(Object.values(this._pendingState))
        this._pendingState = {};
        if (this._autoReconnectCallback) {
          await this._autoReconnectCallback();
        }
        if (this._updateCallback) {
          this._updateCallback(1);
        }

        break;
      } catch (e) {
        this._log.error("WebSocket connection failed attempt : ${attempt + 1}");
        await asyncSleep(this._delay);
      }
    }
  }
}

