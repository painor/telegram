class TLMessage {
  static const SIZE_OVERHEAD = 12;
  static const classType = "constructor";
  var msgId, seqNo, obj;

  TLMessage(msgId, seqNo, obj) {
    this.msgId = msgId;
    this.seqNo = seqNo;
    this.obj = obj;
  }
}
