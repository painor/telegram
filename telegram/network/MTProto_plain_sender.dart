import '../extensions/binary_reader.dart';
import '../utils.dart';
import 'MTProto_state.dart';
import 'connection/connection.dart';

/**
 * MTProto Mobile Protocol plain sender (https://core.telegram.org/mtproto/description#unencrypted-messages)
 */

class MTProtoPlainSender {
  /**
   * Initializes the MTProto plain sender.
   * @param connection connection: the Connection to be used.
   * @param loggers
   */
  MTProtoState _state;
  Connection _connection;
  MTProtoPlainSender(Connection connection, loggers) {
    this._state = new MTProtoState(null, loggers);
    this._connection = connection;
  }

  /**
   * Sends and receives the result for the given request.
   * @param request
   */
  send(request) async {

    List<int> body = request.getBytes();
    BigInt msgId = this._state.getNewMsgId();
    final m = toSignedLittleBuffer(msgId, number: 8);
    final b = new List<int>(4);
    b.addAll(readBufferFromBigInt(body.length, 4,signed: true));

    final res = [new List.filled(8,0), m, b, body].expand((element) => element);

    await this._connection.send(res);
    body = await this._connection.recv();
    if (body.length < 8) {
      throw ("Invalid response buffer (too short $body)");
    }
    final reader = new BinaryReader(body);
    final authKeyId = reader.readLong();
    if (authKeyId!=BigInt.zero) {
      throw('Bad authKeyId');
    }
    msgId = reader.readLong();
    if (msgId ==BigInt.zero) {
      throw('Bad msgId');
    }
    /** ^ We should make sure that the read ``msg_id`` is greater
     * than our own ``msg_id``. However, under some circumstances
     * (bad system clock/working behind proxies) this seems to not
     * be the case, which would cause endless assertion errors.
     */

    final length = reader.readInt();
    if (length <= 0) {
      throw('Bad length');
    }
    /**
     * We could read length bytes and use those in a new reader to read
     * the next TLObject without including the padding, but since the
     * reader isn't used for anything else after this, it's unnecessary.
     */
    return reader.tgReadObject();
  }

}
