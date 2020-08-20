import 'dart:mirrors';

import '../extensions/logger.dart';
import '../network/MTProto_sender.dart';
import '../network/connection/TCP_full.dart';
import '../sessions/string_session.dart';
import '../tl/all_tl_objects.dart';
import '../tl/requests/requests.dart';
import 'dart:io' show Platform;
import '../network/MTProto_plain_sender.dart';

const int DEFAULT_DC_ID = 2;
const String DEFAULT_IPV4_IP = '149.154.167.51';
const String DEFAULT_IPV6_IP = '[2001:67c:4e8:f002::a]';
const int DEFAULT_PORT = 443;

class TelegramClient {
  final int apiId;
  StringSession session;
  var _initWith;
  int _connectionRetries, _requestRetries, _retryDelay;
  final String apiHash;
  MTProtoSender _sender;
  Logger _log;
  Type _connection;

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

   _initSession() async{
    await this.session.load();

    if (this.session.serverAddress==null) {
      this.session.setDC(DEFAULT_DC_ID,  DEFAULT_IPV4_IP, DEFAULT_PORT);
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
      //  updateCallback: this._handleUpdate,
      //isMainSender: true,
    );

    final connection = ConnectionTCPFull(this.session.serverAddress, this.session.port, this.session.dcId, this._log);
    await this._sender.connect(connection);
  }
}
