// @dart=2.10
import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class GetPaymentForm {
    static const CONSTRUCTOR_ID = 2582681413;
    static const SUBCLASS_OF_ID = 2689089305;
    final classType = "request";
    final ID = 2582681413;
	int msgId;


	GetPaymentForm({this.msgId});

	static GetPaymentForm fromReader(BinaryReader reader) {
	var temp,len;var msgId = reader.readInt();		return new GetPaymentForm(msgId : msgId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2582681413,4),readBufferFromBigInt(this.msgId,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetPaymentReceipt {
    static const CONSTRUCTOR_ID = 2693966208;
    static const SUBCLASS_OF_ID = 1493210057;
    final classType = "request";
    final ID = 2693966208;
	int msgId;


	GetPaymentReceipt({this.msgId});

	static GetPaymentReceipt fromReader(BinaryReader reader) {
	var temp,len;var msgId = reader.readInt();		return new GetPaymentReceipt(msgId : msgId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2693966208,4),readBufferFromBigInt(this.msgId,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ValidateRequestedInfo {
    static const CONSTRUCTOR_ID = 1997180532;
    static const SUBCLASS_OF_ID = 2407548087;
    final classType = "request";
    final ID = 1997180532;
	bool save;
	int msgId;
	var info;


	ValidateRequestedInfo({this.save, this.msgId, this.info});

	static ValidateRequestedInfo fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final save = false;var msgId = reader.readInt();var info = reader.tgReadObject();		return new ValidateRequestedInfo(save : save, msgId : msgId, info : info);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1997180532,4),[0,0,0,0],readBufferFromBigInt(this.msgId,4,little:true,signed:true),(this.info.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SendPaymentForm {
    static const CONSTRUCTOR_ID = 730364339;
    static const SUBCLASS_OF_ID = 2330028701;
    final classType = "request";
    final ID = 730364339;
	int msgId;
	String requestedInfoId;
	String shippingOptionId;
	var credentials;


	SendPaymentForm({this.msgId, this.requestedInfoId, this.shippingOptionId, this.credentials});

	static SendPaymentForm fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();var msgId = reader.readInt();var requestedInfoId;if ((flags & 1)==1){var requestedInfoId = reader.tgReadString(); } else {requestedInfoId=null;}var shippingOptionId;if ((flags & 2)==1){var shippingOptionId = reader.tgReadString(); } else {shippingOptionId=null;}var credentials = reader.tgReadObject();		return new SendPaymentForm(msgId : msgId, requestedInfoId : requestedInfoId, shippingOptionId : shippingOptionId, credentials : credentials);
	}
	List<int> getBytes(){return [readBufferFromBigInt(730364339,4),[0,0,0,0],readBufferFromBigInt(this.msgId,4,little:true,signed:true),(this.requestedInfoId==null||this.requestedInfoId==false)?new List<int>():[serializeBytes(this.requestedInfoId)].expand((element) => element).toList(),(this.shippingOptionId==null||this.shippingOptionId==false)?new List<int>():[serializeBytes(this.shippingOptionId)].expand((element) => element).toList(),(this.credentials.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetSavedInfo {
    static const CONSTRUCTOR_ID = 578650699;
    static const SUBCLASS_OF_ID = 2906452294;
    final classType = "request";
    final ID = 578650699;


	GetSavedInfo();

	static GetSavedInfo fromReader(BinaryReader reader) {
	var temp,len;		return new GetSavedInfo();
	}
	List<int> getBytes(){return [readBufferFromBigInt(578650699,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ClearSavedInfo {
    static const CONSTRUCTOR_ID = 3627905217;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3627905217;
	bool credentials;
	bool info;


	ClearSavedInfo({this.credentials, this.info});

	static ClearSavedInfo fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final credentials = false;final info = false;		return new ClearSavedInfo(credentials : credentials, info : info);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3627905217,4),[0,0,0,0],].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetBankCardData {
    static const CONSTRUCTOR_ID = 779736953;
    static const SUBCLASS_OF_ID = 2356008587;
    final classType = "request";
    final ID = 779736953;
	String number;


	GetBankCardData({this.number});

	static GetBankCardData fromReader(BinaryReader reader) {
	var temp,len;var number = reader.tgReadString();		return new GetBankCardData(number : number);
	}
	List<int> getBytes(){return [readBufferFromBigInt(779736953,4),serializeBytes(this.number),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}