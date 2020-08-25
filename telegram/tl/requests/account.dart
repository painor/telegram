import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class RegisterDevice {
    static const CONSTRUCTOR_ID = 1754754159;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 1754754159;
	bool noMuted;
	int tokenType;
	String token;
	bool appSandbox;
	List<int> secret;
	List<int> otherUids;


	RegisterDevice({this.noMuted, this.tokenType, this.token, this.appSandbox, this.secret, this.otherUids});

	static RegisterDevice fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final noMuted = false;var tokenType = reader.readInt();var token = reader.tgReadString();var appSandbox = reader.tgReadBool();var secret = reader.tgReadBytes();reader.readInt();
List<int> otherUids = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		otherUids.add(reader.readInt());
}		return new RegisterDevice(noMuted : noMuted, tokenType : tokenType, token : token, appSandbox : appSandbox, secret : secret, otherUids : otherUids);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1754754159,4),[0,0,0,0],readBufferFromBigInt(this.tokenType,4,little:true,signed:true),serializeBytes(this.token),[this.appSandbox ? 0xb5757299 : 0x379779bc],serializeBytes(this.secret),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.otherUids.length,4,little:true,signed:true),this.otherUids.map((x)=>readBufferFromBigInt(x,4,little:true,signed:true)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class UnregisterDevice {
    static const CONSTRUCTOR_ID = 813089983;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 813089983;
	int tokenType;
	String token;
	List<int> otherUids;


	UnregisterDevice({this.tokenType, this.token, this.otherUids});

	static UnregisterDevice fromReader(BinaryReader reader) {
	var temp,len;var tokenType = reader.readInt();var token = reader.tgReadString();reader.readInt();
List<int> otherUids = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		otherUids.add(reader.readInt());
}		return new UnregisterDevice(tokenType : tokenType, token : token, otherUids : otherUids);
	}
	List<int> getBytes(){return [readBufferFromBigInt(813089983,4),readBufferFromBigInt(this.tokenType,4,little:true,signed:true),serializeBytes(this.token),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.otherUids.length,4,little:true,signed:true),this.otherUids.map((x)=>readBufferFromBigInt(x,4,little:true,signed:true)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class UpdateNotifySettings {
    static const CONSTRUCTOR_ID = 2227067795;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 2227067795;
	var peer;
	var settings;


	UpdateNotifySettings({this.peer, this.settings});

	static UpdateNotifySettings fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var settings = reader.tgReadObject();		return new UpdateNotifySettings(peer : peer, settings : settings);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2227067795,4),(this.peer.getBytes() as List<int>),(this.settings.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetNotifySettings {
    static const CONSTRUCTOR_ID = 313765169;
    static const SUBCLASS_OF_ID = 3475030132;
    final classType = "request";
    final ID = 313765169;
	var peer;


	GetNotifySettings({this.peer});

	static GetNotifySettings fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();		return new GetNotifySettings(peer : peer);
	}
	List<int> getBytes(){return [readBufferFromBigInt(313765169,4),(this.peer.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ResetNotifySettings {
    static const CONSTRUCTOR_ID = 3682473799;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3682473799;


	ResetNotifySettings();

	static ResetNotifySettings fromReader(BinaryReader reader) {
	var temp,len;		return new ResetNotifySettings();
	}
	List<int> getBytes(){return [readBufferFromBigInt(3682473799,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class UpdateProfile {
    static const CONSTRUCTOR_ID = 2018596725;
    static const SUBCLASS_OF_ID = 765557111;
    final classType = "request";
    final ID = 2018596725;
	String firstName;
	String lastName;
	String about;


	UpdateProfile({this.firstName, this.lastName, this.about});

	static UpdateProfile fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();var firstName;if ((flags & 1)==1){var firstName = reader.tgReadString(); } else {firstName=null;}var lastName;if ((flags & 2)==1){var lastName = reader.tgReadString(); } else {lastName=null;}var about;if ((flags & 4)==1){var about = reader.tgReadString(); } else {about=null;}		return new UpdateProfile(firstName : firstName, lastName : lastName, about : about);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2018596725,4),[0,0,0,0],(this.firstName==null||this.firstName==false)?new List<int>():[serializeBytes(this.firstName)].expand((element) => element).toList(),(this.lastName==null||this.lastName==false)?new List<int>():[serializeBytes(this.lastName)].expand((element) => element).toList(),(this.about==null||this.about==false)?new List<int>():[serializeBytes(this.about)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class UpdateStatus {
    static const CONSTRUCTOR_ID = 1713919532;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 1713919532;
	bool offline;


	UpdateStatus({this.offline});

	static UpdateStatus fromReader(BinaryReader reader) {
	var temp,len;var offline = reader.tgReadBool();		return new UpdateStatus(offline : offline);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1713919532,4),[this.offline ? 0xb5757299 : 0x379779bc],].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetWallPapers {
    static const CONSTRUCTOR_ID = 2864387939;
    static const SUBCLASS_OF_ID = 2730838269;
    final classType = "request";
    final ID = 2864387939;
	int hash;


	GetWallPapers({this.hash});

	static GetWallPapers fromReader(BinaryReader reader) {
	var temp,len;var hash = reader.readInt();		return new GetWallPapers(hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2864387939,4),readBufferFromBigInt(this.hash,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ReportPeer {
    static const CONSTRUCTOR_ID = 2920848735;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 2920848735;
	var peer;
	var reason;


	ReportPeer({this.peer, this.reason});

	static ReportPeer fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var reason = reader.tgReadObject();		return new ReportPeer(peer : peer, reason : reason);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2920848735,4),(this.peer.getBytes() as List<int>),(this.reason.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class CheckUsername {
    static const CONSTRUCTOR_ID = 655677548;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 655677548;
	String username;


	CheckUsername({this.username});

	static CheckUsername fromReader(BinaryReader reader) {
	var temp,len;var username = reader.tgReadString();		return new CheckUsername(username : username);
	}
	List<int> getBytes(){return [readBufferFromBigInt(655677548,4),serializeBytes(this.username),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class UpdateUsername {
    static const CONSTRUCTOR_ID = 1040964988;
    static const SUBCLASS_OF_ID = 765557111;
    final classType = "request";
    final ID = 1040964988;
	String username;


	UpdateUsername({this.username});

	static UpdateUsername fromReader(BinaryReader reader) {
	var temp,len;var username = reader.tgReadString();		return new UpdateUsername(username : username);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1040964988,4),serializeBytes(this.username),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetPrivacy {
    static const CONSTRUCTOR_ID = 3671837008;
    static const SUBCLASS_OF_ID = 3042622082;
    final classType = "request";
    final ID = 3671837008;
	var key;


	GetPrivacy({this.key});

	static GetPrivacy fromReader(BinaryReader reader) {
	var temp,len;var key = reader.tgReadObject();		return new GetPrivacy(key : key);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3671837008,4),(this.key.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SetPrivacy {
    static const CONSTRUCTOR_ID = 3388480744;
    static const SUBCLASS_OF_ID = 3042622082;
    final classType = "request";
    final ID = 3388480744;
	var key;
	List<dynamic> rules;


	SetPrivacy({this.key, this.rules});

	static SetPrivacy fromReader(BinaryReader reader) {
	var temp,len;var key = reader.tgReadObject();reader.readInt();
List<dynamic> rules = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		rules.add(reader.tgReadObject());
}		return new SetPrivacy(key : key, rules : rules);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3388480744,4),(this.key.getBytes() as List<int>),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.rules.length,4,little:true,signed:true),this.rules.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class DeleteAccount {
    static const CONSTRUCTOR_ID = 1099779595;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 1099779595;
	String reason;


	DeleteAccount({this.reason});

	static DeleteAccount fromReader(BinaryReader reader) {
	var temp,len;var reason = reader.tgReadString();		return new DeleteAccount(reason : reason);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1099779595,4),serializeBytes(this.reason),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetAccountTTL {
    static const CONSTRUCTOR_ID = 150761757;
    static const SUBCLASS_OF_ID = 3131284872;
    final classType = "request";
    final ID = 150761757;


	GetAccountTTL();

	static GetAccountTTL fromReader(BinaryReader reader) {
	var temp,len;		return new GetAccountTTL();
	}
	List<int> getBytes(){return [readBufferFromBigInt(150761757,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SetAccountTTL {
    static const CONSTRUCTOR_ID = 608323678;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 608323678;
	var ttl;


	SetAccountTTL({this.ttl});

	static SetAccountTTL fromReader(BinaryReader reader) {
	var temp,len;var ttl = reader.tgReadObject();		return new SetAccountTTL(ttl : ttl);
	}
	List<int> getBytes(){return [readBufferFromBigInt(608323678,4),(this.ttl.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SendChangePhoneCode {
    static const CONSTRUCTOR_ID = 2186758885;
    static const SUBCLASS_OF_ID = 1827172481;
    final classType = "request";
    final ID = 2186758885;
	String phoneNumber;
	var settings;


	SendChangePhoneCode({this.phoneNumber, this.settings});

	static SendChangePhoneCode fromReader(BinaryReader reader) {
	var temp,len;var phoneNumber = reader.tgReadString();var settings = reader.tgReadObject();		return new SendChangePhoneCode(phoneNumber : phoneNumber, settings : settings);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2186758885,4),serializeBytes(this.phoneNumber),(this.settings.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ChangePhone {
    static const CONSTRUCTOR_ID = 1891839707;
    static const SUBCLASS_OF_ID = 765557111;
    final classType = "request";
    final ID = 1891839707;
	String phoneNumber;
	String phoneCodeHash;
	String phoneCode;


	ChangePhone({this.phoneNumber, this.phoneCodeHash, this.phoneCode});

	static ChangePhone fromReader(BinaryReader reader) {
	var temp,len;var phoneNumber = reader.tgReadString();var phoneCodeHash = reader.tgReadString();var phoneCode = reader.tgReadString();		return new ChangePhone(phoneNumber : phoneNumber, phoneCodeHash : phoneCodeHash, phoneCode : phoneCode);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1891839707,4),serializeBytes(this.phoneNumber),serializeBytes(this.phoneCodeHash),serializeBytes(this.phoneCode),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class UpdateDeviceLocked {
    static const CONSTRUCTOR_ID = 954152242;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 954152242;
	int period;


	UpdateDeviceLocked({this.period});

	static UpdateDeviceLocked fromReader(BinaryReader reader) {
	var temp,len;var period = reader.readInt();		return new UpdateDeviceLocked(period : period);
	}
	List<int> getBytes(){return [readBufferFromBigInt(954152242,4),readBufferFromBigInt(this.period,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetAuthorizations {
    static const CONSTRUCTOR_ID = 3810574680;
    static const SUBCLASS_OF_ID = 200663295;
    final classType = "request";
    final ID = 3810574680;


	GetAuthorizations();

	static GetAuthorizations fromReader(BinaryReader reader) {
	var temp,len;		return new GetAuthorizations();
	}
	List<int> getBytes(){return [readBufferFromBigInt(3810574680,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ResetAuthorization {
    static const CONSTRUCTOR_ID = 3749180348;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3749180348;
	BigInt hash;


	ResetAuthorization({this.hash});

	static ResetAuthorization fromReader(BinaryReader reader) {
	var temp,len;var hash = reader.readLong();		return new ResetAuthorization(hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3749180348,4),readBufferFromBigInt(this.hash,8,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetPassword {
    static const CONSTRUCTOR_ID = 1418342645;
    static const SUBCLASS_OF_ID = 1403130275;
    final classType = "request";
    final ID = 1418342645;


	GetPassword();

	static GetPassword fromReader(BinaryReader reader) {
	var temp,len;		return new GetPassword();
	}
	List<int> getBytes(){return [readBufferFromBigInt(1418342645,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetPasswordSettings {
    static const CONSTRUCTOR_ID = 2631199481;
    static const SUBCLASS_OF_ID = 3527389304;
    final classType = "request";
    final ID = 2631199481;
	var password;


	GetPasswordSettings({this.password});

	static GetPasswordSettings fromReader(BinaryReader reader) {
	var temp,len;var password = reader.tgReadObject();		return new GetPasswordSettings(password : password);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2631199481,4),(this.password.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class UpdatePasswordSettings {
    static const CONSTRUCTOR_ID = 2778402863;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 2778402863;
	var password;
	var newSettings;


	UpdatePasswordSettings({this.password, this.newSettings});

	static UpdatePasswordSettings fromReader(BinaryReader reader) {
	var temp,len;var password = reader.tgReadObject();var newSettings = reader.tgReadObject();		return new UpdatePasswordSettings(password : password, newSettings : newSettings);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2778402863,4),(this.password.getBytes() as List<int>),(this.newSettings.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SendConfirmPhoneCode {
    static const CONSTRUCTOR_ID = 457157256;
    static const SUBCLASS_OF_ID = 1827172481;
    final classType = "request";
    final ID = 457157256;
	String hash;
	var settings;


	SendConfirmPhoneCode({this.hash, this.settings});

	static SendConfirmPhoneCode fromReader(BinaryReader reader) {
	var temp,len;var hash = reader.tgReadString();var settings = reader.tgReadObject();		return new SendConfirmPhoneCode(hash : hash, settings : settings);
	}
	List<int> getBytes(){return [readBufferFromBigInt(457157256,4),serializeBytes(this.hash),(this.settings.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ConfirmPhone {
    static const CONSTRUCTOR_ID = 1596029123;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 1596029123;
	String phoneCodeHash;
	String phoneCode;


	ConfirmPhone({this.phoneCodeHash, this.phoneCode});

	static ConfirmPhone fromReader(BinaryReader reader) {
	var temp,len;var phoneCodeHash = reader.tgReadString();var phoneCode = reader.tgReadString();		return new ConfirmPhone(phoneCodeHash : phoneCodeHash, phoneCode : phoneCode);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1596029123,4),serializeBytes(this.phoneCodeHash),serializeBytes(this.phoneCode),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetTmpPassword {
    static const CONSTRUCTOR_ID = 1151208273;
    static const SUBCLASS_OF_ID = 2959382829;
    final classType = "request";
    final ID = 1151208273;
	var password;
	int period;


	GetTmpPassword({this.password, this.period});

	static GetTmpPassword fromReader(BinaryReader reader) {
	var temp,len;var password = reader.tgReadObject();var period = reader.readInt();		return new GetTmpPassword(password : password, period : period);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1151208273,4),(this.password.getBytes() as List<int>),readBufferFromBigInt(this.period,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetWebAuthorizations {
    static const CONSTRUCTOR_ID = 405695855;
    static const SUBCLASS_OF_ID = 2587253554;
    final classType = "request";
    final ID = 405695855;


	GetWebAuthorizations();

	static GetWebAuthorizations fromReader(BinaryReader reader) {
	var temp,len;		return new GetWebAuthorizations();
	}
	List<int> getBytes(){return [readBufferFromBigInt(405695855,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ResetWebAuthorization {
    static const CONSTRUCTOR_ID = 755087855;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 755087855;
	BigInt hash;


	ResetWebAuthorization({this.hash});

	static ResetWebAuthorization fromReader(BinaryReader reader) {
	var temp,len;var hash = reader.readLong();		return new ResetWebAuthorization(hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(755087855,4),readBufferFromBigInt(this.hash,8,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ResetWebAuthorizations {
    static const CONSTRUCTOR_ID = 1747789204;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 1747789204;


	ResetWebAuthorizations();

	static ResetWebAuthorizations fromReader(BinaryReader reader) {
	var temp,len;		return new ResetWebAuthorizations();
	}
	List<int> getBytes(){return [readBufferFromBigInt(1747789204,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetAllSecureValues {
    static const CONSTRUCTOR_ID = 2995305597;
    static const SUBCLASS_OF_ID = 3895345441;
    final classType = "request";
    final ID = 2995305597;


	GetAllSecureValues();

	static GetAllSecureValues fromReader(BinaryReader reader) {
	var temp,len;		return new GetAllSecureValues();
	}
	List<int> getBytes(){return [readBufferFromBigInt(2995305597,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetSecureValue {
    static const CONSTRUCTOR_ID = 1936088002;
    static const SUBCLASS_OF_ID = 3895345441;
    final classType = "request";
    final ID = 1936088002;
	List<dynamic> types;


	GetSecureValue({this.types});

	static GetSecureValue fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<dynamic> types = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		types.add(reader.tgReadObject());
}		return new GetSecureValue(types : types);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1936088002,4),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.types.length,4,little:true,signed:true),this.types.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SaveSecureValue {
    static const CONSTRUCTOR_ID = 2308956957;
    static const SUBCLASS_OF_ID = 85014702;
    final classType = "request";
    final ID = 2308956957;
	var value;
	BigInt secureSecretId;


	SaveSecureValue({this.value, this.secureSecretId});

	static SaveSecureValue fromReader(BinaryReader reader) {
	var temp,len;var value = reader.tgReadObject();var secureSecretId = reader.readLong();		return new SaveSecureValue(value : value, secureSecretId : secureSecretId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2308956957,4),(this.value.getBytes() as List<int>),readBufferFromBigInt(this.secureSecretId,8,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class DeleteSecureValue {
    static const CONSTRUCTOR_ID = 3095444555;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3095444555;
	List<dynamic> types;


	DeleteSecureValue({this.types});

	static DeleteSecureValue fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<dynamic> types = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		types.add(reader.tgReadObject());
}		return new DeleteSecureValue(types : types);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3095444555,4),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.types.length,4,little:true,signed:true),this.types.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetAuthorizationForm {
    static const CONSTRUCTOR_ID = 3094063329;
    static const SUBCLASS_OF_ID = 2013567636;
    final classType = "request";
    final ID = 3094063329;
	int botId;
	String scope;
	String publicKey;


	GetAuthorizationForm({this.botId, this.scope, this.publicKey});

	static GetAuthorizationForm fromReader(BinaryReader reader) {
	var temp,len;var botId = reader.readInt();var scope = reader.tgReadString();var publicKey = reader.tgReadString();		return new GetAuthorizationForm(botId : botId, scope : scope, publicKey : publicKey);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3094063329,4),readBufferFromBigInt(this.botId,4,little:true,signed:true),serializeBytes(this.scope),serializeBytes(this.publicKey),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class AcceptAuthorization {
    static const CONSTRUCTOR_ID = 3875699860;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3875699860;
	int botId;
	String scope;
	String publicKey;
	List<dynamic> valueHashes;
	var credentials;


	AcceptAuthorization({this.botId, this.scope, this.publicKey, this.valueHashes, this.credentials});

	static AcceptAuthorization fromReader(BinaryReader reader) {
	var temp,len;var botId = reader.readInt();var scope = reader.tgReadString();var publicKey = reader.tgReadString();reader.readInt();
List<dynamic> valueHashes = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		valueHashes.add(reader.tgReadObject());
}var credentials = reader.tgReadObject();		return new AcceptAuthorization(botId : botId, scope : scope, publicKey : publicKey, valueHashes : valueHashes, credentials : credentials);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3875699860,4),readBufferFromBigInt(this.botId,4,little:true,signed:true),serializeBytes(this.scope),serializeBytes(this.publicKey),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.valueHashes.length,4,little:true,signed:true),this.valueHashes.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),(this.credentials.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SendVerifyPhoneCode {
    static const CONSTRUCTOR_ID = 2778945273;
    static const SUBCLASS_OF_ID = 1827172481;
    final classType = "request";
    final ID = 2778945273;
	String phoneNumber;
	var settings;


	SendVerifyPhoneCode({this.phoneNumber, this.settings});

	static SendVerifyPhoneCode fromReader(BinaryReader reader) {
	var temp,len;var phoneNumber = reader.tgReadString();var settings = reader.tgReadObject();		return new SendVerifyPhoneCode(phoneNumber : phoneNumber, settings : settings);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2778945273,4),serializeBytes(this.phoneNumber),(this.settings.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class VerifyPhone {
    static const CONSTRUCTOR_ID = 1305716726;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 1305716726;
	String phoneNumber;
	String phoneCodeHash;
	String phoneCode;


	VerifyPhone({this.phoneNumber, this.phoneCodeHash, this.phoneCode});

	static VerifyPhone fromReader(BinaryReader reader) {
	var temp,len;var phoneNumber = reader.tgReadString();var phoneCodeHash = reader.tgReadString();var phoneCode = reader.tgReadString();		return new VerifyPhone(phoneNumber : phoneNumber, phoneCodeHash : phoneCodeHash, phoneCode : phoneCode);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1305716726,4),serializeBytes(this.phoneNumber),serializeBytes(this.phoneCodeHash),serializeBytes(this.phoneCode),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SendVerifyEmailCode {
    static const CONSTRUCTOR_ID = 1880182943;
    static const SUBCLASS_OF_ID = 1777582190;
    final classType = "request";
    final ID = 1880182943;
	String email;


	SendVerifyEmailCode({this.email});

	static SendVerifyEmailCode fromReader(BinaryReader reader) {
	var temp,len;var email = reader.tgReadString();		return new SendVerifyEmailCode(email : email);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1880182943,4),serializeBytes(this.email),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class VerifyEmail {
    static const CONSTRUCTOR_ID = 3971627483;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3971627483;
	String email;
	String code;


	VerifyEmail({this.email, this.code});

	static VerifyEmail fromReader(BinaryReader reader) {
	var temp,len;var email = reader.tgReadString();var code = reader.tgReadString();		return new VerifyEmail(email : email, code : code);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3971627483,4),serializeBytes(this.email),serializeBytes(this.code),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class InitTakeoutSession {
    static const CONSTRUCTOR_ID = 4032514052;
    static const SUBCLASS_OF_ID = 2218704517;
    final classType = "request";
    final ID = 4032514052;
	bool contacts;
	bool messageUsers;
	bool messageChats;
	bool messageMegagroups;
	bool messageChannels;
	bool files;
	int fileMaxSize;


	InitTakeoutSession({this.contacts, this.messageUsers, this.messageChats, this.messageMegagroups, this.messageChannels, this.files, this.fileMaxSize});

	static InitTakeoutSession fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final contacts = false;final messageUsers = false;final messageChats = false;final messageMegagroups = false;final messageChannels = false;final files = false;var fileMaxSize;if ((flags & 32)==1){var fileMaxSize = reader.readInt(); } else {fileMaxSize=null;}		return new InitTakeoutSession(contacts : contacts, messageUsers : messageUsers, messageChats : messageChats, messageMegagroups : messageMegagroups, messageChannels : messageChannels, files : files, fileMaxSize : fileMaxSize);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4032514052,4),[0,0,0,0],(this.fileMaxSize==null||this.fileMaxSize==false)?new List<int>():[readBufferFromBigInt(this.fileMaxSize,4,little:true,signed:true)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class FinishTakeoutSession {
    static const CONSTRUCTOR_ID = 489050862;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 489050862;
	bool success;


	FinishTakeoutSession({this.success});

	static FinishTakeoutSession fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final success = false;		return new FinishTakeoutSession(success : success);
	}
	List<int> getBytes(){return [readBufferFromBigInt(489050862,4),[0,0,0,0],].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ConfirmPasswordEmail {
    static const CONSTRUCTOR_ID = 2413762848;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 2413762848;
	String code;


	ConfirmPasswordEmail({this.code});

	static ConfirmPasswordEmail fromReader(BinaryReader reader) {
	var temp,len;var code = reader.tgReadString();		return new ConfirmPasswordEmail(code : code);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2413762848,4),serializeBytes(this.code),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ResendPasswordEmail {
    static const CONSTRUCTOR_ID = 2055154197;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 2055154197;


	ResendPasswordEmail();

	static ResendPasswordEmail fromReader(BinaryReader reader) {
	var temp,len;		return new ResendPasswordEmail();
	}
	List<int> getBytes(){return [readBufferFromBigInt(2055154197,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class CancelPasswordEmail {
    static const CONSTRUCTOR_ID = 3251361206;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3251361206;


	CancelPasswordEmail();

	static CancelPasswordEmail fromReader(BinaryReader reader) {
	var temp,len;		return new CancelPasswordEmail();
	}
	List<int> getBytes(){return [readBufferFromBigInt(3251361206,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetContactSignUpNotification {
    static const CONSTRUCTOR_ID = 2668087080;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 2668087080;


	GetContactSignUpNotification();

	static GetContactSignUpNotification fromReader(BinaryReader reader) {
	var temp,len;		return new GetContactSignUpNotification();
	}
	List<int> getBytes(){return [readBufferFromBigInt(2668087080,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SetContactSignUpNotification {
    static const CONSTRUCTOR_ID = 3488890721;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3488890721;
	bool silent;


	SetContactSignUpNotification({this.silent});

	static SetContactSignUpNotification fromReader(BinaryReader reader) {
	var temp,len;var silent = reader.tgReadBool();		return new SetContactSignUpNotification(silent : silent);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3488890721,4),[this.silent ? 0xb5757299 : 0x379779bc],].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetNotifyExceptions {
    static const CONSTRUCTOR_ID = 1398240377;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 1398240377;
	bool compareSound;
	var peer;


	GetNotifyExceptions({this.compareSound, this.peer});

	static GetNotifyExceptions fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final compareSound = false;var peer;if ((flags & 1)==1){var peer = reader.tgReadObject(); } else {peer=null;}		return new GetNotifyExceptions(compareSound : compareSound, peer : peer);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1398240377,4),[0,0,0,0],(this.peer==null||this.peer==false)?new List<int>():[(this.peer.getBytes() as List<int>)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetWallPaper {
    static const CONSTRUCTOR_ID = 4237155306;
    static const SUBCLASS_OF_ID = 2527250827;
    final classType = "request";
    final ID = 4237155306;
	var wallpaper;


	GetWallPaper({this.wallpaper});

	static GetWallPaper fromReader(BinaryReader reader) {
	var temp,len;var wallpaper = reader.tgReadObject();		return new GetWallPaper(wallpaper : wallpaper);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4237155306,4),(this.wallpaper.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class UploadWallPaper {
    static const CONSTRUCTOR_ID = 3716494945;
    static const SUBCLASS_OF_ID = 2527250827;
    final classType = "request";
    final ID = 3716494945;
	var file;
	String mimeType;
	var settings;


	UploadWallPaper({this.file, this.mimeType, this.settings});

	static UploadWallPaper fromReader(BinaryReader reader) {
	var temp,len;var file = reader.tgReadObject();var mimeType = reader.tgReadString();var settings = reader.tgReadObject();		return new UploadWallPaper(file : file, mimeType : mimeType, settings : settings);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3716494945,4),(this.file.getBytes() as List<int>),serializeBytes(this.mimeType),(this.settings.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SaveWallPaper {
    static const CONSTRUCTOR_ID = 1817860919;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 1817860919;
	var wallpaper;
	bool unsave;
	var settings;


	SaveWallPaper({this.wallpaper, this.unsave, this.settings});

	static SaveWallPaper fromReader(BinaryReader reader) {
	var temp,len;var wallpaper = reader.tgReadObject();var unsave = reader.tgReadBool();var settings = reader.tgReadObject();		return new SaveWallPaper(wallpaper : wallpaper, unsave : unsave, settings : settings);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1817860919,4),(this.wallpaper.getBytes() as List<int>),[this.unsave ? 0xb5757299 : 0x379779bc],(this.settings.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class InstallWallPaper {
    static const CONSTRUCTOR_ID = 4276967273;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 4276967273;
	var wallpaper;
	var settings;


	InstallWallPaper({this.wallpaper, this.settings});

	static InstallWallPaper fromReader(BinaryReader reader) {
	var temp,len;var wallpaper = reader.tgReadObject();var settings = reader.tgReadObject();		return new InstallWallPaper(wallpaper : wallpaper, settings : settings);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4276967273,4),(this.wallpaper.getBytes() as List<int>),(this.settings.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ResetWallPapers {
    static const CONSTRUCTOR_ID = 3141244932;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3141244932;


	ResetWallPapers();

	static ResetWallPapers fromReader(BinaryReader reader) {
	var temp,len;		return new ResetWallPapers();
	}
	List<int> getBytes(){return [readBufferFromBigInt(3141244932,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetAutoDownloadSettings {
    static const CONSTRUCTOR_ID = 1457130303;
    static const SUBCLASS_OF_ID = 800610593;
    final classType = "request";
    final ID = 1457130303;


	GetAutoDownloadSettings();

	static GetAutoDownloadSettings fromReader(BinaryReader reader) {
	var temp,len;		return new GetAutoDownloadSettings();
	}
	List<int> getBytes(){return [readBufferFromBigInt(1457130303,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SaveAutoDownloadSettings {
    static const CONSTRUCTOR_ID = 1995661875;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 1995661875;
	bool low;
	bool high;
	var settings;


	SaveAutoDownloadSettings({this.low, this.high, this.settings});

	static SaveAutoDownloadSettings fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final low = false;final high = false;var settings = reader.tgReadObject();		return new SaveAutoDownloadSettings(low : low, high : high, settings : settings);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1995661875,4),[0,0,0,0],(this.settings.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class UploadTheme {
    static const CONSTRUCTOR_ID = 473805619;
    static const SUBCLASS_OF_ID = 555739168;
    final classType = "request";
    final ID = 473805619;
	var file;
	var thumb;
	String fileName;
	String mimeType;


	UploadTheme({this.file, this.thumb, this.fileName, this.mimeType});

	static UploadTheme fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();var file = reader.tgReadObject();var thumb;if ((flags & 1)==1){var thumb = reader.tgReadObject(); } else {thumb=null;}var fileName = reader.tgReadString();var mimeType = reader.tgReadString();		return new UploadTheme(file : file, thumb : thumb, fileName : fileName, mimeType : mimeType);
	}
	List<int> getBytes(){return [readBufferFromBigInt(473805619,4),[0,0,0,0],(this.file.getBytes() as List<int>),(this.thumb==null||this.thumb==false)?new List<int>():[(this.thumb.getBytes() as List<int>)].expand((element) => element).toList(),serializeBytes(this.fileName),serializeBytes(this.mimeType),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class CreateTheme {
    static const CONSTRUCTOR_ID = 2217919007;
    static const SUBCLASS_OF_ID = 1454688268;
    final classType = "request";
    final ID = 2217919007;
	String slug;
	String title;
	var document;
	var settings;


	CreateTheme({this.slug, this.title, this.document, this.settings});

	static CreateTheme fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();var slug = reader.tgReadString();var title = reader.tgReadString();var document;if ((flags & 4)==1){var document = reader.tgReadObject(); } else {document=null;}var settings;if ((flags & 8)==1){var settings = reader.tgReadObject(); } else {settings=null;}		return new CreateTheme(slug : slug, title : title, document : document, settings : settings);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2217919007,4),[0,0,0,0],serializeBytes(this.slug),serializeBytes(this.title),(this.document==null||this.document==false)?new List<int>():[(this.document.getBytes() as List<int>)].expand((element) => element).toList(),(this.settings==null||this.settings==false)?new List<int>():[(this.settings.getBytes() as List<int>)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class UpdateTheme {
    static const CONSTRUCTOR_ID = 1555261397;
    static const SUBCLASS_OF_ID = 1454688268;
    final classType = "request";
    final ID = 1555261397;
	String format;
	var theme;
	String slug;
	String title;
	var document;
	var settings;


	UpdateTheme({this.format, this.theme, this.slug, this.title, this.document, this.settings});

	static UpdateTheme fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();var format = reader.tgReadString();var theme = reader.tgReadObject();var slug;if ((flags & 1)==1){var slug = reader.tgReadString(); } else {slug=null;}var title;if ((flags & 2)==1){var title = reader.tgReadString(); } else {title=null;}var document;if ((flags & 4)==1){var document = reader.tgReadObject(); } else {document=null;}var settings;if ((flags & 8)==1){var settings = reader.tgReadObject(); } else {settings=null;}		return new UpdateTheme(format : format, theme : theme, slug : slug, title : title, document : document, settings : settings);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1555261397,4),[0,0,0,0],serializeBytes(this.format),(this.theme.getBytes() as List<int>),(this.slug==null||this.slug==false)?new List<int>():[serializeBytes(this.slug)].expand((element) => element).toList(),(this.title==null||this.title==false)?new List<int>():[serializeBytes(this.title)].expand((element) => element).toList(),(this.document==null||this.document==false)?new List<int>():[(this.document.getBytes() as List<int>)].expand((element) => element).toList(),(this.settings==null||this.settings==false)?new List<int>():[(this.settings.getBytes() as List<int>)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SaveTheme {
    static const CONSTRUCTOR_ID = 4065792108;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 4065792108;
	var theme;
	bool unsave;


	SaveTheme({this.theme, this.unsave});

	static SaveTheme fromReader(BinaryReader reader) {
	var temp,len;var theme = reader.tgReadObject();var unsave = reader.tgReadBool();		return new SaveTheme(theme : theme, unsave : unsave);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4065792108,4),(this.theme.getBytes() as List<int>),[this.unsave ? 0xb5757299 : 0x379779bc],].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class InstallTheme {
    static const CONSTRUCTOR_ID = 2061776695;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 2061776695;
	bool dark;
	String format;
	var theme;


	InstallTheme({this.dark, this.format, this.theme});

	static InstallTheme fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final dark = false;var format;if ((flags & 2)==1){var format = reader.tgReadString(); } else {format=null;}var theme;if ((flags & 2)==1){var theme = reader.tgReadObject(); } else {theme=null;}		return new InstallTheme(dark : dark, format : format, theme : theme);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2061776695,4),[0,0,0,0],(this.format==null||this.format==false)?new List<int>():[serializeBytes(this.format)].expand((element) => element).toList(),(this.theme==null||this.theme==false)?new List<int>():[(this.theme.getBytes() as List<int>)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetTheme {
    static const CONSTRUCTOR_ID = 2375906347;
    static const SUBCLASS_OF_ID = 1454688268;
    final classType = "request";
    final ID = 2375906347;
	String format;
	var theme;
	BigInt documentId;


	GetTheme({this.format, this.theme, this.documentId});

	static GetTheme fromReader(BinaryReader reader) {
	var temp,len;var format = reader.tgReadString();var theme = reader.tgReadObject();var documentId = reader.readLong();		return new GetTheme(format : format, theme : theme, documentId : documentId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2375906347,4),serializeBytes(this.format),(this.theme.getBytes() as List<int>),readBufferFromBigInt(this.documentId,8,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetThemes {
    static const CONSTRUCTOR_ID = 676939512;
    static const SUBCLASS_OF_ID = 2143625732;
    final classType = "request";
    final ID = 676939512;
	String format;
	int hash;


	GetThemes({this.format, this.hash});

	static GetThemes fromReader(BinaryReader reader) {
	var temp,len;var format = reader.tgReadString();var hash = reader.readInt();		return new GetThemes(format : format, hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(676939512,4),serializeBytes(this.format),readBufferFromBigInt(this.hash,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SetContentSettings {
    static const CONSTRUCTOR_ID = 3044323691;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3044323691;
	bool sensitiveEnabled;


	SetContentSettings({this.sensitiveEnabled});

	static SetContentSettings fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final sensitiveEnabled = false;		return new SetContentSettings(sensitiveEnabled : sensitiveEnabled);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3044323691,4),[0,0,0,0],].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetContentSettings {
    static const CONSTRUCTOR_ID = 2342210990;
    static const SUBCLASS_OF_ID = 2923427985;
    final classType = "request";
    final ID = 2342210990;


	GetContentSettings();

	static GetContentSettings fromReader(BinaryReader reader) {
	var temp,len;		return new GetContentSettings();
	}
	List<int> getBytes(){return [readBufferFromBigInt(2342210990,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetMultiWallPapers {
    static const CONSTRUCTOR_ID = 1705865692;
    static const SUBCLASS_OF_ID = 2395165315;
    final classType = "request";
    final ID = 1705865692;
	List<dynamic> wallpapers;


	GetMultiWallPapers({this.wallpapers});

	static GetMultiWallPapers fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<dynamic> wallpapers = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		wallpapers.add(reader.tgReadObject());
}		return new GetMultiWallPapers(wallpapers : wallpapers);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1705865692,4),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.wallpapers.length,4,little:true,signed:true),this.wallpapers.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}