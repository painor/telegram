import '../telegram/client/telegram_client.dart';

main() async {
  var client = TelegramClient("aa", 1, "a", {});
  await client.connect();
  print("Connected successfully");
}
