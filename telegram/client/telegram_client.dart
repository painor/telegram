import 'dart:math';

import '../extensions/logger.dart';
import '../network/MTProto_sender.dart';
import '../network/connection/TCP_full.dart';
import '../sessions/string_session.dart';
import '../tl/all_tl_objects.dart';
import '../tl/requests/requests.dart';
import '../tl/constructors/constructors.dart';
import 'dart:io' show Platform;
import '../tl/requests/help.dart';
import '../utils.dart';

const int DEFAULT_DC_ID = 2;
const String DEFAULT_IPV4_IP = '149.154.167.51';
const String DEFAULT_IPV6_IP = '[2001:67c:4e8:f002::a]';
const int DEFAULT_PORT = 443;

class TelegramClient {
  final int apiId;
  late StringSession session;
  late var _initWith;
  int? _connectionRetries, _requestRetries, _retryDelay;
  final String apiHash;
  MTProtoSender? _sender;
  Logger? _log;
  Type? _connection;
  late var _eventBuilders;

  TelegramClient(session, this.apiId, this.apiHash,
      {connection: ConnectionTCPFull,
      langCode: 'en',
      systemLangCode: 'en',
      baseLogger: 'telegram',
      deviceModel: 'Unknown',
      systemVersion: '1.0',
      connectionRetries: 10,
      retryDelay: 5,
      requestRetries: 10,
      appVersion: '1.0'}) {
    if (apiId == null || apiHash == null) {
      throw ('Your API ID or Hash are invalid. Please read "Requirements" on README.md');
    }
    this._requestRetries = requestRetries;
    this._connectionRetries = connectionRetries;
    this._connection = connection;
    this._retryDelay = retryDelay;
    this._eventBuilders = [];

    this._log = new Logger();
    this.session = StringSession(session: null);
    _initWith = (x) {
      return new InvokeWithLayer(
        layer: LAYER,
        query: new InitConnection(
          apiId: this.apiId,
          deviceModel: deviceModel ?? Platform.operatingSystem,
          systemVersion: systemVersion ?? Platform.operatingSystemVersion,
          appVersion: appVersion ?? '1.0',
          langCode: langCode,
          langPack: '',
          // this should be left empty.
          systemLangCode: systemLangCode,
          query: x,
          proxy: null, // no proxies yet.
        ),
      );
    };
  }

  _authKeyCallback(authKey, dcId) async {
    this.session.setAuthKey(authKey, dcId);
  }

  _initSession() async {
    await this.session.load();

    if (this.session.serverAddress == null) {
      this.session.setDC(DEFAULT_DC_ID, DEFAULT_IPV4_IP, DEFAULT_PORT);
    }
  }

  _handleUpdate(update) {
    //this.session.processEntities(update)
    // this._entityCache.add(update)
    if (update is Updates || update is UpdatesCombined) {
      // TODO deal with entities
      const entities = [];
      for (final x in [...update.users, ...update.chats]) {
        entities.add(x);
      }
      for (final u in update.updates) {
        this._processUpdate(
            update: u, others: update.updates, entities: entities);
      }
    } else if (update is UpdateShort) {
      this._processUpdate(update: update.update, others: null);
    } else {
      this._processUpdate(update: update, others: null);
    }
    // TODO add caching
    // this._stateCache.update(update)
  }

  _processUpdate({required update, others, entities}) {
    update._entities = entities ?? [];
    this._dispatchUpdate(
      update: update,
      others: others,
    );
  }

  _dispatchUpdate({
    update: null,
    others: null,
    channelId: null,
    ptsDate: null,
  }) async {
    for (final ev in this._eventBuilders) {
      var builder = ev['builder'];
      var callback = ev['callback'];
      final event = builder.build(update);
      if (event) {
        await callback(event);
      }
    }
  }

  connect() async {
    await _initSession();
    this._sender = new MTProtoSender(
      this.session.getAuthKey(0),
      logger: this._log,
      dcId: this.session.dcId,
      retries: this._connectionRetries,
      delay: this._retryDelay,
      //autoReconnect: this._autoReconnect,
      //connectTimeout: this._timeout,
      authKeyCallback: this._authKeyCallback,
      updateCallback: this._handleUpdate,
      //isMainSender: true,
    );

    final connection = ConnectionTCPFull(this.session.serverAddress,
        this.session.port, this.session.dcId, this._log);
    if (!await this
        ._sender!
        .connect(connection, eventDispatch: this._dispatchUpdate)) {
      return;
    }
    this.session.setAuthKey(this._sender!.authKey, null);
    await this._sender!.send(this._initWith(
          new GetConfig(),
        ));

    //this._dispatchUpdate({ update: new UpdateConnectionState(1) })

    this._updateLoop();
  }

  isConnected() {
    if (this._sender != null) {
      if (this._sender!.isConnected()!) {
        return true;
      }
    }
    return false;
  }

  _updateLoop() async {
    while (this.isConnected()) {
      Random random = Random.secure();

      final rnd = random.nextInt(2 ^ 32);
      await asyncSleep(60);
      // We don't care about the result we just want to send it every
      // 60 seconds so telegram doesn't stop the connection
      try {
        this._sender!.send(new Ping(
              pingId: BigInt.from(rnd),
            ));
      } catch (e) {}

      // We need to send some content-related request at least hourly
      // for Telegram to keep delivering updates, otherwise they will
      // just stop even if we're connected. Do so every 30 minutes.

      // TODO Call getDifference instead since it's more relevant
      /*if (new Date().getTime() - this._lastRequest > 30 * 60 * 1000) {
        try {
          await this.invoke(new requests.updates.GetState())
        } catch (e) {

        }
      }*/
    }
  }
}
