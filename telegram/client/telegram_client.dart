library telegram;

import 'telegram_base_client.dart';

class TelegramClient extends TelegramBaseClient {
  TelegramClient(session, api_id, api_hash, client_params) : super(session, api_id, api_hash, client_params);

  dynamic invoke(dynamic request) {
    return sender!.send(request);
  }
}