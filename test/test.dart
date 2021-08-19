import '../telegram/client/telegram_client.dart';

class A {
  static int b = 5;
}

main() async {
  var client = TelegramClient("aa", 1, "a");
  await client.connect();
  print("Connected successfully");
}
