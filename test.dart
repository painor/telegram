import 'package:convert/convert.dart';

import 'telegram/client/telegram_client.dart';
import 'telegram/tl/requests/requests.dart';
import 'telegram/tl/constructors/constructors.dart';
import 'dart:math';
import 'telegram/utils.dart';
import 'telegram/crypto/factorizator.dart';

main() {
  var client = TelegramClient("aa", 1, "a");
  client.connect();

}
