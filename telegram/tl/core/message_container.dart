import '../../extensions/binary_reader.dart';
import 'TLMessage.dart';

class MessageContainer {
  static final CONSTRUCTOR_ID = 0x73f1f8dc;
  static final classType = "constructor";

  // Maximum size in bytes for the inner payload of the container.
  // Telegram will close the connection if the payload is bigger.
  // The overhead of the container itself is subtracted.
  static const MAXIMUM_SIZE = 1044456 - 8;

  // Maximum amount of messages that can't be sent inside a single
  // container, inclusive. Beyond this limit Telegram will respond
  // with BAD_MESSAGE 64 (invalid container).
  //
  // This limit is not 100% accurate and may in some cases be higher.
  // However, sending up to 100 requests at once in a single container
  // is a reasonable conservative value, since it could also depend on
  // other factors like size per request, but we cannot know this.
  static const MAXIMUM_LENGTH = 100;
  var messages;
  var ID = 0x73f1f8dc;
  MessageContainer({this.messages});

  static fromReader(BinaryReader reader) {
    final messages = [];
    final length = reader.readInt();
    for (var x = 0; x < length; x++) {
      final msgId = reader.readLong();
      final seqNo = reader.readInt();
      final length = reader.readInt();
      final before = reader.tellPosition();
      final obj = reader.tgReadObject();
      reader.setPosition(before + length);
      final tlMessage = new TLMessage(msgId, seqNo, obj);
      messages.add(tlMessage);
    }
    return new MessageContainer(messages: messages);
  }
}
