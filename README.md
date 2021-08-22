# telegram
Telegram Dart API

## Generating classes

To generate classes simply run the /tl/api.dart file. It will create a new constructor and requests file. 
You need to have an api.tl and schema.tl files for it.

## Invoking requests

To invoke any requests simple call client.invoke. There are no error handling as the library is still barebone but it should handle all request.
