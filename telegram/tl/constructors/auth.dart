import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class SentCode {
    static const CONSTRUCTOR_ID = 1577067778;
    static const SUBCLASS_OF_ID = 1827172481;
	var type;
	String phoneCodeHash;
	var nextType;
	int timeout;


	SentCode({this.type, this.phoneCodeHash, this.nextType, this.timeout});

	static SentCode fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();var type = reader.tgReadObject();var phoneCodeHash = reader.tgReadString();var nextType;if ((flags & 2)==1){var nextType = reader.tgReadObject(); } else {nextType=null;}var timeout;if ((flags & 4)==1){var timeout = reader.readInt(); } else {timeout=null;}		return new SentCode(type : type, phoneCodeHash : phoneCodeHash, nextType : nextType, timeout : timeout);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1577067778,4),[0,0,0,0],this.type.getBytes(),serializeBytes(this.phoneCodeHash),(this.nextType==null||this.nextType==false)?[]:[this.nextType.getBytes()],(this.timeout==null||this.timeout==false)?[]:[readBufferFromBigInt(this.timeout,4,little:true,signed:true)],].expand((element) => element).toList();}

}

class Authorization {
    static const CONSTRUCTOR_ID = 3439659286;
    static const SUBCLASS_OF_ID = 3118485049;
	int tmpSessions;
	var user;


	Authorization({this.tmpSessions, this.user});

	static Authorization fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();var tmpSessions;if ((flags & 1)==1){var tmpSessions = reader.readInt(); } else {tmpSessions=null;}var user = reader.tgReadObject();		return new Authorization(tmpSessions : tmpSessions, user : user);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3439659286,4),[0,0,0,0],(this.tmpSessions==null||this.tmpSessions==false)?[]:[readBufferFromBigInt(this.tmpSessions,4,little:true,signed:true)],this.user.getBytes(),].expand((element) => element).toList();}

}

class AuthorizationSignUpRequired {
    static const CONSTRUCTOR_ID = 1148485274;
    static const SUBCLASS_OF_ID = 3118485049;
	var termsOfService;


	AuthorizationSignUpRequired({this.termsOfService});

	static AuthorizationSignUpRequired fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();var termsOfService;if ((flags & 1)==1){var termsOfService = reader.tgReadObject(); } else {termsOfService=null;}		return new AuthorizationSignUpRequired(termsOfService : termsOfService);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1148485274,4),[0,0,0,0],(this.termsOfService==null||this.termsOfService==false)?[]:[this.termsOfService.getBytes()],].expand((element) => element).toList();}

}

class ExportedAuthorization {
    static const CONSTRUCTOR_ID = 3751189549;
    static const SUBCLASS_OF_ID = 1607593041;
	int id;
	List<int> bytes;


	ExportedAuthorization({this.id, this.bytes});

	static ExportedAuthorization fromReader(BinaryReader reader) {
	var temp,len;var id = reader.readInt();var bytes = reader.tgReadBytes();		return new ExportedAuthorization(id : id, bytes : bytes);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3751189549,4),readBufferFromBigInt(this.id,4,little:true,signed:true),serializeBytes(this.bytes),].expand((element) => element).toList();}

}

class PasswordRecovery {
    static const CONSTRUCTOR_ID = 326715557;
    static const SUBCLASS_OF_ID = 4201829434;
	String emailPattern;


	PasswordRecovery({this.emailPattern});

	static PasswordRecovery fromReader(BinaryReader reader) {
	var temp,len;var emailPattern = reader.tgReadString();		return new PasswordRecovery(emailPattern : emailPattern);
	}
	List<int> getBytes(){return [readBufferFromBigInt(326715557,4),serializeBytes(this.emailPattern),].expand((element) => element).toList();}

}

class CodeTypeSms {
    static const CONSTRUCTOR_ID = 1923290508;
    static const SUBCLASS_OF_ID = 3019105281;


	CodeTypeSms();

	static CodeTypeSms fromReader(BinaryReader reader) {
	var temp,len;		return new CodeTypeSms();
	}
	List<int> getBytes(){return [readBufferFromBigInt(1923290508,4),].expand((element) => element).toList();}

}

class CodeTypeCall {
    static const CONSTRUCTOR_ID = 1948046307;
    static const SUBCLASS_OF_ID = 3019105281;


	CodeTypeCall();

	static CodeTypeCall fromReader(BinaryReader reader) {
	var temp,len;		return new CodeTypeCall();
	}
	List<int> getBytes(){return [readBufferFromBigInt(1948046307,4),].expand((element) => element).toList();}

}

class CodeTypeFlashCall {
    static const CONSTRUCTOR_ID = 577556219;
    static const SUBCLASS_OF_ID = 3019105281;


	CodeTypeFlashCall();

	static CodeTypeFlashCall fromReader(BinaryReader reader) {
	var temp,len;		return new CodeTypeFlashCall();
	}
	List<int> getBytes(){return [readBufferFromBigInt(577556219,4),].expand((element) => element).toList();}

}

class SentCodeTypeApp {
    static const CONSTRUCTOR_ID = 1035688326;
    static const SUBCLASS_OF_ID = 4284159374;
	int length;


	SentCodeTypeApp({this.length});

	static SentCodeTypeApp fromReader(BinaryReader reader) {
	var temp,len;var length = reader.readInt();		return new SentCodeTypeApp(length : length);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1035688326,4),readBufferFromBigInt(this.length,4,little:true,signed:true),].expand((element) => element).toList();}

}

class SentCodeTypeSms {
    static const CONSTRUCTOR_ID = 3221273506;
    static const SUBCLASS_OF_ID = 4284159374;
	int length;


	SentCodeTypeSms({this.length});

	static SentCodeTypeSms fromReader(BinaryReader reader) {
	var temp,len;var length = reader.readInt();		return new SentCodeTypeSms(length : length);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3221273506,4),readBufferFromBigInt(this.length,4,little:true,signed:true),].expand((element) => element).toList();}

}

class SentCodeTypeCall {
    static const CONSTRUCTOR_ID = 1398007207;
    static const SUBCLASS_OF_ID = 4284159374;
	int length;


	SentCodeTypeCall({this.length});

	static SentCodeTypeCall fromReader(BinaryReader reader) {
	var temp,len;var length = reader.readInt();		return new SentCodeTypeCall(length : length);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1398007207,4),readBufferFromBigInt(this.length,4,little:true,signed:true),].expand((element) => element).toList();}

}

class SentCodeTypeFlashCall {
    static const CONSTRUCTOR_ID = 2869151449;
    static const SUBCLASS_OF_ID = 4284159374;
	String pattern;


	SentCodeTypeFlashCall({this.pattern});

	static SentCodeTypeFlashCall fromReader(BinaryReader reader) {
	var temp,len;var pattern = reader.tgReadString();		return new SentCodeTypeFlashCall(pattern : pattern);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2869151449,4),serializeBytes(this.pattern),].expand((element) => element).toList();}

}

class LoginToken {
    static const CONSTRUCTOR_ID = 1654593920;
    static const SUBCLASS_OF_ID = 1800795702;
	int expires;
	List<int> token;


	LoginToken({this.expires, this.token});

	static LoginToken fromReader(BinaryReader reader) {
	var temp,len;var expires = reader.readInt();var token = reader.tgReadBytes();		return new LoginToken(expires : expires, token : token);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1654593920,4),readBufferFromBigInt(this.expires,4,little:true,signed:true),serializeBytes(this.token),].expand((element) => element).toList();}

}

class LoginTokenMigrateTo {
    static const CONSTRUCTOR_ID = 110008598;
    static const SUBCLASS_OF_ID = 1800795702;
	int dcId;
	List<int> token;


	LoginTokenMigrateTo({this.dcId, this.token});

	static LoginTokenMigrateTo fromReader(BinaryReader reader) {
	var temp,len;var dcId = reader.readInt();var token = reader.tgReadBytes();		return new LoginTokenMigrateTo(dcId : dcId, token : token);
	}
	List<int> getBytes(){return [readBufferFromBigInt(110008598,4),readBufferFromBigInt(this.dcId,4,little:true,signed:true),serializeBytes(this.token),].expand((element) => element).toList();}

}

class LoginTokenSuccess {
    static const CONSTRUCTOR_ID = 957176926;
    static const SUBCLASS_OF_ID = 1800795702;
	var authorization;


	LoginTokenSuccess({this.authorization});

	static LoginTokenSuccess fromReader(BinaryReader reader) {
	var temp,len;var authorization = reader.tgReadObject();		return new LoginTokenSuccess(authorization : authorization);
	}
	List<int> getBytes(){return [readBufferFromBigInt(957176926,4),this.authorization.getBytes(),].expand((element) => element).toList();}

}