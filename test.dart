import 'package:convert/convert.dart';

import 'telegram/tl/requests/help.dart';
import 'telegram/client/telegram_client.dart';
import 'dart:io' show Platform;
import 'telegram/extensions/binary_reader.dart';
import 'telegram/utils.dart';
import 'telegram/tl/constructors/constructors.dart';
class A{
  static int b = 5;

}
main()async{
var client = TelegramClient("aa", 1, "a");
await client.connect();
print("Connected successfully");
}
