import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class PaymentForm {
    static const CONSTRUCTOR_ID = 1062645411;
    static const SUBCLASS_OF_ID = 2689089305;
    final classType = "constructor";
    final ID = 1062645411;
	bool canSaveCredentials;
	bool passwordMissing;
	int botId;
	var invoice;
	int providerId;
	String url;
	String nativeProvider;
	var nativeParams;
	var savedInfo;
	var savedCredentials;
	List<dynamic> users;


	PaymentForm({this.canSaveCredentials, this.passwordMissing, this.botId, this.invoice, this.providerId, this.url, this.nativeProvider, this.nativeParams, this.savedInfo, this.savedCredentials, this.users});

	static PaymentForm fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final canSaveCredentials = false;final passwordMissing = false;var botId = reader.readInt();var invoice = reader.tgReadObject();var providerId = reader.readInt();var url = reader.tgReadString();var nativeProvider;if ((flags & 16)==1){var nativeProvider = reader.tgReadString(); } else {nativeProvider=null;}var nativeParams;if ((flags & 16)==1){var nativeParams = reader.tgReadObject(); } else {nativeParams=null;}var savedInfo;if ((flags & 1)==1){var savedInfo = reader.tgReadObject(); } else {savedInfo=null;}var savedCredentials;if ((flags & 2)==1){var savedCredentials = reader.tgReadObject(); } else {savedCredentials=null;}reader.readInt();
List<dynamic> users = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		users.add(reader.tgReadObject());
}		return new PaymentForm(canSaveCredentials : canSaveCredentials, passwordMissing : passwordMissing, botId : botId, invoice : invoice, providerId : providerId, url : url, nativeProvider : nativeProvider, nativeParams : nativeParams, savedInfo : savedInfo, savedCredentials : savedCredentials, users : users);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1062645411,4),[0,0,0,0],readBufferFromBigInt(this.botId,4,little:true,signed:true),(this.invoice.getBytes() as List<int>),readBufferFromBigInt(this.providerId,4,little:true,signed:true),serializeBytes(this.url),(this.nativeProvider==null||this.nativeProvider==false)?new List<int>():[serializeBytes(this.nativeProvider)].expand((element) => element).toList(),(this.nativeParams==null||this.nativeParams==false)?new List<int>():[(this.nativeParams.getBytes() as List<int>)].expand((element) => element).toList(),(this.savedInfo==null||this.savedInfo==false)?new List<int>():[(this.savedInfo.getBytes() as List<int>)].expand((element) => element).toList(),(this.savedCredentials==null||this.savedCredentials==false)?new List<int>():[(this.savedCredentials.getBytes() as List<int>)].expand((element) => element).toList(),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.users.length,4,little:true,signed:true),this.users.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}

}

class ValidatedRequestedInfo {
    static const CONSTRUCTOR_ID = 3510966403;
    static const SUBCLASS_OF_ID = 2407548087;
    final classType = "constructor";
    final ID = 3510966403;
	String id;
	List<dynamic> shippingOptions;


	ValidatedRequestedInfo({this.id, this.shippingOptions});

	static ValidatedRequestedInfo fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();var id;if ((flags & 1)==1){var id = reader.tgReadString(); } else {id=null;}var shippingOptions;if ((flags & 2)==1){reader.readInt();
List<dynamic> shippingOptions = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		shippingOptions.add(reader.tgReadObject());
} } else {shippingOptions=null;}		return new ValidatedRequestedInfo(id : id, shippingOptions : shippingOptions);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3510966403,4),[0,0,0,0],(this.id==null||this.id==false)?new List<int>():[serializeBytes(this.id)].expand((element) => element).toList(),(this.shippingOptions==null||this.shippingOptions==false)?new List<int>():[readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.shippingOptions.length,4,little:true,signed:true),this.shippingOptions.map((x)=>(x.getBytes() as List<int>)).expand((element) => element)].expand((element) => element).toList(),].expand((element) => element).toList();}

}

class PaymentResult {
    static const CONSTRUCTOR_ID = 1314881805;
    static const SUBCLASS_OF_ID = 2330028701;
    final classType = "constructor";
    final ID = 1314881805;
	var updates;


	PaymentResult({this.updates});

	static PaymentResult fromReader(BinaryReader reader) {
	var temp,len;var updates = reader.tgReadObject();		return new PaymentResult(updates : updates);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1314881805,4),(this.updates.getBytes() as List<int>),].expand((element) => element).toList();}

}

class PaymentVerificationNeeded {
    static const CONSTRUCTOR_ID = 3628142905;
    static const SUBCLASS_OF_ID = 2330028701;
    final classType = "constructor";
    final ID = 3628142905;
	String url;


	PaymentVerificationNeeded({this.url});

	static PaymentVerificationNeeded fromReader(BinaryReader reader) {
	var temp,len;var url = reader.tgReadString();		return new PaymentVerificationNeeded(url : url);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3628142905,4),serializeBytes(this.url),].expand((element) => element).toList();}

}

class PaymentReceipt {
    static const CONSTRUCTOR_ID = 1342771681;
    static const SUBCLASS_OF_ID = 1493210057;
    final classType = "constructor";
    final ID = 1342771681;
	int date;
	int botId;
	var invoice;
	int providerId;
	var info;
	var shipping;
	String currency;
	BigInt totalAmount;
	String credentialsTitle;
	List<dynamic> users;


	PaymentReceipt({this.date, this.botId, this.invoice, this.providerId, this.info, this.shipping, this.currency, this.totalAmount, this.credentialsTitle, this.users});

	static PaymentReceipt fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();var date = reader.readInt();var botId = reader.readInt();var invoice = reader.tgReadObject();var providerId = reader.readInt();var info;if ((flags & 1)==1){var info = reader.tgReadObject(); } else {info=null;}var shipping;if ((flags & 2)==1){var shipping = reader.tgReadObject(); } else {shipping=null;}var currency = reader.tgReadString();var totalAmount = reader.readLong();var credentialsTitle = reader.tgReadString();reader.readInt();
List<dynamic> users = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		users.add(reader.tgReadObject());
}		return new PaymentReceipt(date : date, botId : botId, invoice : invoice, providerId : providerId, info : info, shipping : shipping, currency : currency, totalAmount : totalAmount, credentialsTitle : credentialsTitle, users : users);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1342771681,4),[0,0,0,0],readBufferFromBigInt(this.date,4,little:true,signed:true),readBufferFromBigInt(this.botId,4,little:true,signed:true),(this.invoice.getBytes() as List<int>),readBufferFromBigInt(this.providerId,4,little:true,signed:true),(this.info==null||this.info==false)?new List<int>():[(this.info.getBytes() as List<int>)].expand((element) => element).toList(),(this.shipping==null||this.shipping==false)?new List<int>():[(this.shipping.getBytes() as List<int>)].expand((element) => element).toList(),serializeBytes(this.currency),readBufferFromBigInt(this.totalAmount,8,little:true,signed:true),serializeBytes(this.credentialsTitle),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.users.length,4,little:true,signed:true),this.users.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}

}

class SavedInfo {
    static const CONSTRUCTOR_ID = 4220511292;
    static const SUBCLASS_OF_ID = 2906452294;
    final classType = "constructor";
    final ID = 4220511292;
	bool hasSavedCredentials;
	var savedInfo;


	SavedInfo({this.hasSavedCredentials, this.savedInfo});

	static SavedInfo fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final hasSavedCredentials = false;var savedInfo;if ((flags & 1)==1){var savedInfo = reader.tgReadObject(); } else {savedInfo=null;}		return new SavedInfo(hasSavedCredentials : hasSavedCredentials, savedInfo : savedInfo);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4220511292,4),[0,0,0,0],(this.savedInfo==null||this.savedInfo==false)?new List<int>():[(this.savedInfo.getBytes() as List<int>)].expand((element) => element).toList(),].expand((element) => element).toList();}

}

class BankCardData {
    static const CONSTRUCTOR_ID = 1042605427;
    static const SUBCLASS_OF_ID = 2356008587;
    final classType = "constructor";
    final ID = 1042605427;
	String title;
	List<dynamic> openUrls;


	BankCardData({this.title, this.openUrls});

	static BankCardData fromReader(BinaryReader reader) {
	var temp,len;var title = reader.tgReadString();reader.readInt();
List<dynamic> openUrls = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		openUrls.add(reader.tgReadObject());
}		return new BankCardData(title : title, openUrls : openUrls);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1042605427,4),serializeBytes(this.title),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.openUrls.length,4,little:true,signed:true),this.openUrls.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}

}