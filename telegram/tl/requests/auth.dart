// @dart=2.10
import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class SendCode {
    static const CONSTRUCTOR_ID = 2792825935;
    static const SUBCLASS_OF_ID = 1827172481;
    final classType = "request";
    final ID = 2792825935;
	String phoneNumber;
	int apiId;
	String apiHash;
	var settings;


	SendCode({this.phoneNumber, this.apiId, this.apiHash, this.settings});

	static SendCode fromReader(BinaryReader reader) {
	var temp,len;var phoneNumber = reader.tgReadString();var apiId = reader.readInt();var apiHash = reader.tgReadString();var settings = reader.tgReadObject();		return new SendCode(phoneNumber : phoneNumber, apiId : apiId, apiHash : apiHash, settings : settings);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2792825935,4),serializeBytes(this.phoneNumber),readBufferFromBigInt(this.apiId,4,little:true,signed:true),serializeBytes(this.apiHash),(this.settings.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SignUp {
    static const CONSTRUCTOR_ID = 2163139623;
    static const SUBCLASS_OF_ID = 3118485049;
    final classType = "request";
    final ID = 2163139623;
	String phoneNumber;
	String phoneCodeHash;
	String firstName;
	String lastName;


	SignUp({this.phoneNumber, this.phoneCodeHash, this.firstName, this.lastName});

	static SignUp fromReader(BinaryReader reader) {
	var temp,len;var phoneNumber = reader.tgReadString();var phoneCodeHash = reader.tgReadString();var firstName = reader.tgReadString();var lastName = reader.tgReadString();		return new SignUp(phoneNumber : phoneNumber, phoneCodeHash : phoneCodeHash, firstName : firstName, lastName : lastName);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2163139623,4),serializeBytes(this.phoneNumber),serializeBytes(this.phoneCodeHash),serializeBytes(this.firstName),serializeBytes(this.lastName),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SignIn {
    static const CONSTRUCTOR_ID = 3168081281;
    static const SUBCLASS_OF_ID = 3118485049;
    final classType = "request";
    final ID = 3168081281;
	String phoneNumber;
	String phoneCodeHash;
	String phoneCode;


	SignIn({this.phoneNumber, this.phoneCodeHash, this.phoneCode});

	static SignIn fromReader(BinaryReader reader) {
	var temp,len;var phoneNumber = reader.tgReadString();var phoneCodeHash = reader.tgReadString();var phoneCode = reader.tgReadString();		return new SignIn(phoneNumber : phoneNumber, phoneCodeHash : phoneCodeHash, phoneCode : phoneCode);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3168081281,4),serializeBytes(this.phoneNumber),serializeBytes(this.phoneCodeHash),serializeBytes(this.phoneCode),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class LogOut {
    static const CONSTRUCTOR_ID = 1461180992;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 1461180992;


	LogOut();

	static LogOut fromReader(BinaryReader reader) {
	var temp,len;		return new LogOut();
	}
	List<int> getBytes(){return [readBufferFromBigInt(1461180992,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ResetAuthorizations {
    static const CONSTRUCTOR_ID = 2678787354;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 2678787354;


	ResetAuthorizations();

	static ResetAuthorizations fromReader(BinaryReader reader) {
	var temp,len;		return new ResetAuthorizations();
	}
	List<int> getBytes(){return [readBufferFromBigInt(2678787354,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ExportAuthorization {
    static const CONSTRUCTOR_ID = 3854565325;
    static const SUBCLASS_OF_ID = 1607593041;
    final classType = "request";
    final ID = 3854565325;
	int dcId;


	ExportAuthorization({this.dcId});

	static ExportAuthorization fromReader(BinaryReader reader) {
	var temp,len;var dcId = reader.readInt();		return new ExportAuthorization(dcId : dcId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3854565325,4),readBufferFromBigInt(this.dcId,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ImportAuthorization {
    static const CONSTRUCTOR_ID = 3824129555;
    static const SUBCLASS_OF_ID = 3118485049;
    final classType = "request";
    final ID = 3824129555;
	int id;
	List<int> bytes;


	ImportAuthorization({this.id, this.bytes});

	static ImportAuthorization fromReader(BinaryReader reader) {
	var temp,len;var id = reader.readInt();var bytes = reader.tgReadBytes();		return new ImportAuthorization(id : id, bytes : bytes);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3824129555,4),readBufferFromBigInt(this.id,4,little:true,signed:true),serializeBytes(this.bytes),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class BindTempAuthKey {
    static const CONSTRUCTOR_ID = 3453233669;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3453233669;
	BigInt permAuthKeyId;
	BigInt nonce;
	int expiresAt;
	List<int> encryptedMessage;


	BindTempAuthKey({this.permAuthKeyId, this.nonce, this.expiresAt, this.encryptedMessage});

	static BindTempAuthKey fromReader(BinaryReader reader) {
	var temp,len;var permAuthKeyId = reader.readLong();var nonce = reader.readLong();var expiresAt = reader.readInt();var encryptedMessage = reader.tgReadBytes();		return new BindTempAuthKey(permAuthKeyId : permAuthKeyId, nonce : nonce, expiresAt : expiresAt, encryptedMessage : encryptedMessage);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3453233669,4),readBufferFromBigInt(this.permAuthKeyId,8,little:true,signed:true),readBufferFromBigInt(this.nonce,8,little:true,signed:true),readBufferFromBigInt(this.expiresAt,4,little:true,signed:true),serializeBytes(this.encryptedMessage),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ImportBotAuthorization {
    static const CONSTRUCTOR_ID = 1738800940;
    static const SUBCLASS_OF_ID = 3118485049;
    final classType = "request";
    final ID = 1738800940;
	int flags;
	int apiId;
	String apiHash;
	String botAuthToken;


	ImportBotAuthorization({this.flags, this.apiId, this.apiHash, this.botAuthToken});

	static ImportBotAuthorization fromReader(BinaryReader reader) {
	var temp,len;var flags = reader.readInt();var apiId = reader.readInt();var apiHash = reader.tgReadString();var botAuthToken = reader.tgReadString();		return new ImportBotAuthorization(apiId : apiId, apiHash : apiHash, botAuthToken : botAuthToken);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1738800940,4),readBufferFromBigInt(this.flags,4,little:true,signed:true),readBufferFromBigInt(this.apiId,4,little:true,signed:true),serializeBytes(this.apiHash),serializeBytes(this.botAuthToken),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class CheckPassword {
    static const CONSTRUCTOR_ID = 3515567382;
    static const SUBCLASS_OF_ID = 3118485049;
    final classType = "request";
    final ID = 3515567382;
	var password;


	CheckPassword({this.password});

	static CheckPassword fromReader(BinaryReader reader) {
	var temp,len;var password = reader.tgReadObject();		return new CheckPassword(password : password);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3515567382,4),(this.password.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class RequestPasswordRecovery {
    static const CONSTRUCTOR_ID = 3633822822;
    static const SUBCLASS_OF_ID = 4201829434;
    final classType = "request";
    final ID = 3633822822;


	RequestPasswordRecovery();

	static RequestPasswordRecovery fromReader(BinaryReader reader) {
	var temp,len;		return new RequestPasswordRecovery();
	}
	List<int> getBytes(){return [readBufferFromBigInt(3633822822,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class RecoverPassword {
    static const CONSTRUCTOR_ID = 1319464594;
    static const SUBCLASS_OF_ID = 3118485049;
    final classType = "request";
    final ID = 1319464594;
	String code;


	RecoverPassword({this.code});

	static RecoverPassword fromReader(BinaryReader reader) {
	var temp,len;var code = reader.tgReadString();		return new RecoverPassword(code : code);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1319464594,4),serializeBytes(this.code),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ResendCode {
    static const CONSTRUCTOR_ID = 1056025023;
    static const SUBCLASS_OF_ID = 1827172481;
    final classType = "request";
    final ID = 1056025023;
	String phoneNumber;
	String phoneCodeHash;


	ResendCode({this.phoneNumber, this.phoneCodeHash});

	static ResendCode fromReader(BinaryReader reader) {
	var temp,len;var phoneNumber = reader.tgReadString();var phoneCodeHash = reader.tgReadString();		return new ResendCode(phoneNumber : phoneNumber, phoneCodeHash : phoneCodeHash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1056025023,4),serializeBytes(this.phoneNumber),serializeBytes(this.phoneCodeHash),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class CancelCode {
    static const CONSTRUCTOR_ID = 520357240;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 520357240;
	String phoneNumber;
	String phoneCodeHash;


	CancelCode({this.phoneNumber, this.phoneCodeHash});

	static CancelCode fromReader(BinaryReader reader) {
	var temp,len;var phoneNumber = reader.tgReadString();var phoneCodeHash = reader.tgReadString();		return new CancelCode(phoneNumber : phoneNumber, phoneCodeHash : phoneCodeHash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(520357240,4),serializeBytes(this.phoneNumber),serializeBytes(this.phoneCodeHash),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class DropTempAuthKeys {
    static const CONSTRUCTOR_ID = 2387124616;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 2387124616;
	List<BigInt> exceptAuthKeys;


	DropTempAuthKeys({this.exceptAuthKeys});

	static DropTempAuthKeys fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<BigInt> exceptAuthKeys = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		exceptAuthKeys.add(reader.readLong());
}		return new DropTempAuthKeys(exceptAuthKeys : exceptAuthKeys);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2387124616,4),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.exceptAuthKeys.length,4,little:true,signed:true),this.exceptAuthKeys.map((x)=>readBufferFromBigInt(x,8,little:true,signed:true)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ExportLoginToken {
    static const CONSTRUCTOR_ID = 2981369111;
    static const SUBCLASS_OF_ID = 1800795702;
    final classType = "request";
    final ID = 2981369111;
	int apiId;
	String apiHash;
	List<int> exceptIds;


	ExportLoginToken({this.apiId, this.apiHash, this.exceptIds});

	static ExportLoginToken fromReader(BinaryReader reader) {
	var temp,len;var apiId = reader.readInt();var apiHash = reader.tgReadString();reader.readInt();
List<int> exceptIds = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		exceptIds.add(reader.readInt());
}		return new ExportLoginToken(apiId : apiId, apiHash : apiHash, exceptIds : exceptIds);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2981369111,4),readBufferFromBigInt(this.apiId,4,little:true,signed:true),serializeBytes(this.apiHash),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.exceptIds.length,4,little:true,signed:true),this.exceptIds.map((x)=>readBufferFromBigInt(x,4,little:true,signed:true)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ImportLoginToken {
    static const CONSTRUCTOR_ID = 2511101156;
    static const SUBCLASS_OF_ID = 1800795702;
    final classType = "request";
    final ID = 2511101156;
	List<int> token;


	ImportLoginToken({this.token});

	static ImportLoginToken fromReader(BinaryReader reader) {
	var temp,len;var token = reader.tgReadBytes();		return new ImportLoginToken(token : token);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2511101156,4),serializeBytes(this.token),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class AcceptLoginToken {
    static const CONSTRUCTOR_ID = 3902057805;
    static const SUBCLASS_OF_ID = 3373514778;
    final classType = "request";
    final ID = 3902057805;
	List<int> token;


	AcceptLoginToken({this.token});

	static AcceptLoginToken fromReader(BinaryReader reader) {
	var temp,len;var token = reader.tgReadBytes();		return new AcceptLoginToken(token : token);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3902057805,4),serializeBytes(this.token),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}