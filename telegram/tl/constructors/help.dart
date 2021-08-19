// @dart=2.10
import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class AppUpdate {
    static const CONSTRUCTOR_ID = 497489295;
    static const SUBCLASS_OF_ID = 1486292638;
    final classType = "constructor";
    final ID = 497489295;
	bool canNotSkip;
	int id;
	String version;
	String text;
	List<dynamic> entities;
	var document;
	String url;


	AppUpdate({this.canNotSkip, this.id, this.version, this.text, this.entities, this.document, this.url});

	static AppUpdate fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final canNotSkip = false;var id = reader.readInt();var version = reader.tgReadString();var text = reader.tgReadString();reader.readInt();
List<dynamic> entities = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		entities.add(reader.tgReadObject());
}var document;if ((flags & 2)==1){var document = reader.tgReadObject(); } else {document=null;}var url;if ((flags & 4)==1){var url = reader.tgReadString(); } else {url=null;}		return new AppUpdate(canNotSkip : canNotSkip, id : id, version : version, text : text, entities : entities, document : document, url : url);
	}
	List<int> getBytes(){return [readBufferFromBigInt(497489295,4),[0,0,0,0],readBufferFromBigInt(this.id,4,little:true,signed:true),serializeBytes(this.version),serializeBytes(this.text),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.entities.length,4,little:true,signed:true),this.entities.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),(this.document==null||this.document==false)?new List<int>():[(this.document.getBytes() as List<int>)].expand((element) => element).toList(),(this.url==null||this.url==false)?new List<int>():[serializeBytes(this.url)].expand((element) => element).toList(),].expand((element) => element).toList();}

}

class NoAppUpdate {
    static const CONSTRUCTOR_ID = 3294258486;
    static const SUBCLASS_OF_ID = 1486292638;
    final classType = "constructor";
    final ID = 3294258486;


	NoAppUpdate();

	static NoAppUpdate fromReader(BinaryReader reader) {
	var temp,len;		return new NoAppUpdate();
	}
	List<int> getBytes(){return [readBufferFromBigInt(3294258486,4),].expand((element) => element).toList();}

}

class InviteText {
    static const CONSTRUCTOR_ID = 415997816;
    static const SUBCLASS_OF_ID = 3480267317;
    final classType = "constructor";
    final ID = 415997816;
	String message;


	InviteText({this.message});

	static InviteText fromReader(BinaryReader reader) {
	var temp,len;var message = reader.tgReadString();		return new InviteText(message : message);
	}
	List<int> getBytes(){return [readBufferFromBigInt(415997816,4),serializeBytes(this.message),].expand((element) => element).toList();}

}

class Support {
    static const CONSTRUCTOR_ID = 398898678;
    static const SUBCLASS_OF_ID = 1901706475;
    final classType = "constructor";
    final ID = 398898678;
	String phoneNumber;
	var user;


	Support({this.phoneNumber, this.user});

	static Support fromReader(BinaryReader reader) {
	var temp,len;var phoneNumber = reader.tgReadString();var user = reader.tgReadObject();		return new Support(phoneNumber : phoneNumber, user : user);
	}
	List<int> getBytes(){return [readBufferFromBigInt(398898678,4),serializeBytes(this.phoneNumber),(this.user.getBytes() as List<int>),].expand((element) => element).toList();}

}

class TermsOfService {
    static const CONSTRUCTOR_ID = 2013922064;
    static const SUBCLASS_OF_ID = 552502034;
    final classType = "constructor";
    final ID = 2013922064;
	bool popup;
	var id;
	String text;
	List<dynamic> entities;
	int minAgeConfirm;


	TermsOfService({this.popup, this.id, this.text, this.entities, this.minAgeConfirm});

	static TermsOfService fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final popup = false;var id = reader.tgReadObject();var text = reader.tgReadString();reader.readInt();
List<dynamic> entities = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		entities.add(reader.tgReadObject());
}var minAgeConfirm;if ((flags & 2)==1){var minAgeConfirm = reader.readInt(); } else {minAgeConfirm=null;}		return new TermsOfService(popup : popup, id : id, text : text, entities : entities, minAgeConfirm : minAgeConfirm);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2013922064,4),[0,0,0,0],(this.id.getBytes() as List<int>),serializeBytes(this.text),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.entities.length,4,little:true,signed:true),this.entities.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),(this.minAgeConfirm==null||this.minAgeConfirm==false)?new List<int>():[readBufferFromBigInt(this.minAgeConfirm,4,little:true,signed:true)].expand((element) => element).toList(),].expand((element) => element).toList();}

}

class RecentMeUrls {
    static const CONSTRUCTOR_ID = 235081943;
    static const SUBCLASS_OF_ID = 4067017847;
    final classType = "constructor";
    final ID = 235081943;
	List<dynamic> urls;
	List<dynamic> chats;
	List<dynamic> users;


	RecentMeUrls({this.urls, this.chats, this.users});

	static RecentMeUrls fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<dynamic> urls = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		urls.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> chats = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		chats.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> users = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		users.add(reader.tgReadObject());
}		return new RecentMeUrls(urls : urls, chats : chats, users : users);
	}
	List<int> getBytes(){return [readBufferFromBigInt(235081943,4),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.urls.length,4,little:true,signed:true),this.urls.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.chats.length,4,little:true,signed:true),this.chats.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.users.length,4,little:true,signed:true),this.users.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}

}

class ProxyDataEmpty {
    static const CONSTRUCTOR_ID = 3768459192;
    static const SUBCLASS_OF_ID = 568501320;
    final classType = "constructor";
    final ID = 3768459192;
	int expires;


	ProxyDataEmpty({this.expires});

	static ProxyDataEmpty fromReader(BinaryReader reader) {
	var temp,len;var expires = reader.readInt();		return new ProxyDataEmpty(expires : expires);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3768459192,4),readBufferFromBigInt(this.expires,4,little:true,signed:true),].expand((element) => element).toList();}

}

class ProxyDataPromo {
    static const CONSTRUCTOR_ID = 737668643;
    static const SUBCLASS_OF_ID = 568501320;
    final classType = "constructor";
    final ID = 737668643;
	int expires;
	var peer;
	List<dynamic> chats;
	List<dynamic> users;


	ProxyDataPromo({this.expires, this.peer, this.chats, this.users});

	static ProxyDataPromo fromReader(BinaryReader reader) {
	var temp,len;var expires = reader.readInt();var peer = reader.tgReadObject();reader.readInt();
List<dynamic> chats = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		chats.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> users = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		users.add(reader.tgReadObject());
}		return new ProxyDataPromo(expires : expires, peer : peer, chats : chats, users : users);
	}
	List<int> getBytes(){return [readBufferFromBigInt(737668643,4),readBufferFromBigInt(this.expires,4,little:true,signed:true),(this.peer.getBytes() as List<int>),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.chats.length,4,little:true,signed:true),this.chats.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.users.length,4,little:true,signed:true),this.users.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}

}

class TermsOfServiceUpdateEmpty {
    static const CONSTRUCTOR_ID = 3811614591;
    static const SUBCLASS_OF_ID = 691808631;
    final classType = "constructor";
    final ID = 3811614591;
	int expires;


	TermsOfServiceUpdateEmpty({this.expires});

	static TermsOfServiceUpdateEmpty fromReader(BinaryReader reader) {
	var temp,len;var expires = reader.readInt();		return new TermsOfServiceUpdateEmpty(expires : expires);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3811614591,4),readBufferFromBigInt(this.expires,4,little:true,signed:true),].expand((element) => element).toList();}

}

class TermsOfServiceUpdate {
    static const CONSTRUCTOR_ID = 686618977;
    static const SUBCLASS_OF_ID = 691808631;
    final classType = "constructor";
    final ID = 686618977;
	int expires;
	var termsOfService;


	TermsOfServiceUpdate({this.expires, this.termsOfService});

	static TermsOfServiceUpdate fromReader(BinaryReader reader) {
	var temp,len;var expires = reader.readInt();var termsOfService = reader.tgReadObject();		return new TermsOfServiceUpdate(expires : expires, termsOfService : termsOfService);
	}
	List<int> getBytes(){return [readBufferFromBigInt(686618977,4),readBufferFromBigInt(this.expires,4,little:true,signed:true),(this.termsOfService.getBytes() as List<int>),].expand((element) => element).toList();}

}

class DeepLinkInfoEmpty {
    static const CONSTRUCTOR_ID = 1722786150;
    static const SUBCLASS_OF_ID = 2555030584;
    final classType = "constructor";
    final ID = 1722786150;


	DeepLinkInfoEmpty();

	static DeepLinkInfoEmpty fromReader(BinaryReader reader) {
	var temp,len;		return new DeepLinkInfoEmpty();
	}
	List<int> getBytes(){return [readBufferFromBigInt(1722786150,4),].expand((element) => element).toList();}

}

class DeepLinkInfo {
    static const CONSTRUCTOR_ID = 1783556146;
    static const SUBCLASS_OF_ID = 2555030584;
    final classType = "constructor";
    final ID = 1783556146;
	bool updateApp;
	String message;
	List<dynamic> entities;


	DeepLinkInfo({this.updateApp, this.message, this.entities});

	static DeepLinkInfo fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final updateApp = false;var message = reader.tgReadString();var entities;if ((flags & 2)==1){reader.readInt();
List<dynamic> entities = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		entities.add(reader.tgReadObject());
} } else {entities=null;}		return new DeepLinkInfo(updateApp : updateApp, message : message, entities : entities);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1783556146,4),[0,0,0,0],serializeBytes(this.message),(this.entities==null||this.entities==false)?new List<int>():[readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.entities.length,4,little:true,signed:true),this.entities.map((x)=>(x.getBytes() as List<int>)).expand((element) => element)].expand((element) => element).toList(),].expand((element) => element).toList();}

}

class PassportConfigNotModified {
    static const CONSTRUCTOR_ID = 3216634967;
    static const SUBCLASS_OF_ID = 3328622765;
    final classType = "constructor";
    final ID = 3216634967;


	PassportConfigNotModified();

	static PassportConfigNotModified fromReader(BinaryReader reader) {
	var temp,len;		return new PassportConfigNotModified();
	}
	List<int> getBytes(){return [readBufferFromBigInt(3216634967,4),].expand((element) => element).toList();}

}

class PassportConfig {
    static const CONSTRUCTOR_ID = 2694370991;
    static const SUBCLASS_OF_ID = 3328622765;
    final classType = "constructor";
    final ID = 2694370991;
	int hash;
	var countriesLangs;


	PassportConfig({this.hash, this.countriesLangs});

	static PassportConfig fromReader(BinaryReader reader) {
	var temp,len;var hash = reader.readInt();var countriesLangs = reader.tgReadObject();		return new PassportConfig(hash : hash, countriesLangs : countriesLangs);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2694370991,4),readBufferFromBigInt(this.hash,4,little:true,signed:true),(this.countriesLangs.getBytes() as List<int>),].expand((element) => element).toList();}

}

class SupportName {
    static const CONSTRUCTOR_ID = 2349199817;
    static const SUBCLASS_OF_ID = 2135996354;
    final classType = "constructor";
    final ID = 2349199817;
	String name;


	SupportName({this.name});

	static SupportName fromReader(BinaryReader reader) {
	var temp,len;var name = reader.tgReadString();		return new SupportName(name : name);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2349199817,4),serializeBytes(this.name),].expand((element) => element).toList();}

}

class UserInfoEmpty {
    static const CONSTRUCTOR_ID = 4088278765;
    static const SUBCLASS_OF_ID = 1548998616;
    final classType = "constructor";
    final ID = 4088278765;


	UserInfoEmpty();

	static UserInfoEmpty fromReader(BinaryReader reader) {
	var temp,len;		return new UserInfoEmpty();
	}
	List<int> getBytes(){return [readBufferFromBigInt(4088278765,4),].expand((element) => element).toList();}

}

class UserInfo {
    static const CONSTRUCTOR_ID = 32192344;
    static const SUBCLASS_OF_ID = 1548998616;
    final classType = "constructor";
    final ID = 32192344;
	String message;
	List<dynamic> entities;
	String author;
	int date;


	UserInfo({this.message, this.entities, this.author, this.date});

	static UserInfo fromReader(BinaryReader reader) {
	var temp,len;var message = reader.tgReadString();reader.readInt();
List<dynamic> entities = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		entities.add(reader.tgReadObject());
}var author = reader.tgReadString();var date = reader.readInt();		return new UserInfo(message : message, entities : entities, author : author, date : date);
	}
	List<int> getBytes(){return [readBufferFromBigInt(32192344,4),serializeBytes(this.message),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.entities.length,4,little:true,signed:true),this.entities.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),serializeBytes(this.author),readBufferFromBigInt(this.date,4,little:true,signed:true),].expand((element) => element).toList();}

}

class ConfigSimple {
    static const CONSTRUCTOR_ID = 1515793004;
    static const SUBCLASS_OF_ID = 689453764;
    final classType = "constructor";
    final ID = 1515793004;
	int date;
	int expires;
	List<dynamic> rules;


	ConfigSimple({this.date, this.expires, this.rules});

	static ConfigSimple fromReader(BinaryReader reader) {
	var temp,len;var date = reader.readInt();var expires = reader.readInt();List<dynamic> rules = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		rules.add(reader.tgReadObject());
}		return new ConfigSimple(date : date, expires : expires, rules : rules);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1515793004,4),readBufferFromBigInt(this.date,4,little:true,signed:true),readBufferFromBigInt(this.expires,4,little:true,signed:true),readBufferFromBigInt(this.rules.length,4,little:true,signed:true),this.rules.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}

}