// @dart=2.10
import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class GetMessages {
    static const CONSTRUCTOR_ID = 1673946374;
    static const SUBCLASS_OF_ID = 3568569182;
    final classType = "request";
    final ID = 1673946374;
	List<dynamic> id;


	GetMessages({this.id});

	static GetMessages fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<dynamic> id = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		id.add(reader.tgReadObject());
}		return new GetMessages(id : id);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1673946374,4),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.id.length,4,little:true,signed:true),this.id.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetDialogs {
    static const CONSTRUCTOR_ID = 2699967347;
    static const SUBCLASS_OF_ID = 236671726;
    final classType = "request";
    final ID = 2699967347;
	bool excludePinned;
	int folderId;
	int offsetDate;
	int offsetId;
	var offsetPeer;
	int limit;
	int hash;


	GetDialogs({this.excludePinned, this.folderId, this.offsetDate, this.offsetId, this.offsetPeer, this.limit, this.hash});

	static GetDialogs fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final excludePinned = false;var folderId;if ((flags & 2)==1){var folderId = reader.readInt(); } else {folderId=null;}var offsetDate = reader.readInt();var offsetId = reader.readInt();var offsetPeer = reader.tgReadObject();var limit = reader.readInt();var hash = reader.readInt();		return new GetDialogs(excludePinned : excludePinned, folderId : folderId, offsetDate : offsetDate, offsetId : offsetId, offsetPeer : offsetPeer, limit : limit, hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2699967347,4),[0,0,0,0],(this.folderId==null||this.folderId==false)?new List<int>():[readBufferFromBigInt(this.folderId,4,little:true,signed:true)].expand((element) => element).toList(),readBufferFromBigInt(this.offsetDate,4,little:true,signed:true),readBufferFromBigInt(this.offsetId,4,little:true,signed:true),(this.offsetPeer.getBytes() as List<int>),readBufferFromBigInt(this.limit,4,little:true,signed:true),readBufferFromBigInt(this.hash,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetHistory {
    static const CONSTRUCTOR_ID = 3703276128;
    static const SUBCLASS_OF_ID = 3568569182;
    final classType = "request";
    final ID = 3703276128;
	var peer;
	int offsetId;
	int offsetDate;
	int addOffset;
	int limit;
	int maxId;
	int minId;
	int hash;


	GetHistory({this.peer, this.offsetId, this.offsetDate, this.addOffset, this.limit, this.maxId, this.minId, this.hash});

	static GetHistory fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var offsetId = reader.readInt();var offsetDate = reader.readInt();var addOffset = reader.readInt();var limit = reader.readInt();var maxId = reader.readInt();var minId = reader.readInt();var hash = reader.readInt();		return new GetHistory(peer : peer, offsetId : offsetId, offsetDate : offsetDate, addOffset : addOffset, limit : limit, maxId : maxId, minId : minId, hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3703276128,4),(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.offsetId,4,little:true,signed:true),readBufferFromBigInt(this.offsetDate,4,little:true,signed:true),readBufferFromBigInt(this.addOffset,4,little:true,signed:true),readBufferFromBigInt(this.limit,4,little:true,signed:true),readBufferFromBigInt(this.maxId,4,little:true,signed:true),readBufferFromBigInt(this.minId,4,little:true,signed:true),readBufferFromBigInt(this.hash,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class Search {
    static const CONSTRUCTOR_ID = 2249518952;
    static const SUBCLASS_OF_ID = 3568569182;
    final classType = "request";
    final ID = 2249518952;
	var peer;
	String q;
	var fromId;
	var filter;
	int minDate;
	int maxDate;
	int offsetId;
	int addOffset;
	int limit;
	int maxId;
	int minId;
	int hash;


	Search({this.peer, this.q, this.fromId, this.filter, this.minDate, this.maxDate, this.offsetId, this.addOffset, this.limit, this.maxId, this.minId, this.hash});

	static Search fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();var peer = reader.tgReadObject();var q = reader.tgReadString();var fromId;if ((flags & 1)==1){var fromId = reader.tgReadObject(); } else {fromId=null;}var filter = reader.tgReadObject();var minDate = reader.readInt();var maxDate = reader.readInt();var offsetId = reader.readInt();var addOffset = reader.readInt();var limit = reader.readInt();var maxId = reader.readInt();var minId = reader.readInt();var hash = reader.readInt();		return new Search(peer : peer, q : q, fromId : fromId, filter : filter, minDate : minDate, maxDate : maxDate, offsetId : offsetId, addOffset : addOffset, limit : limit, maxId : maxId, minId : minId, hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2249518952,4),[0,0,0,0],(this.peer.getBytes() as List<int>),serializeBytes(this.q),(this.fromId==null||this.fromId==false)?new List<int>():[(this.fromId.getBytes() as List<int>)].expand((element) => element).toList(),(this.filter.getBytes() as List<int>),readBufferFromBigInt(this.minDate,4,little:true,signed:true),readBufferFromBigInt(this.maxDate,4,little:true,signed:true),readBufferFromBigInt(this.offsetId,4,little:true,signed:true),readBufferFromBigInt(this.addOffset,4,little:true,signed:true),readBufferFromBigInt(this.limit,4,little:true,signed:true),readBufferFromBigInt(this.maxId,4,little:true,signed:true),readBufferFromBigInt(this.minId,4,little:true,signed:true),readBufferFromBigInt(this.hash,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ReadHistory {
    static const CONSTRUCTOR_ID = 238054714;
    static const SUBCLASS_OF_ID = 3469983854;
    final classType = "request";
    final ID = 238054714;
	var peer;
	int maxId;


	ReadHistory({this.peer, this.maxId});

	static ReadHistory fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var maxId = reader.readInt();		return new ReadHistory(peer : peer, maxId : maxId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(238054714,4),(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.maxId,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class DeleteHistory {
    static const CONSTRUCTOR_ID = 469850889;
    static const SUBCLASS_OF_ID = 743031062;
    final classType = "request";
    final ID = 469850889;
	bool justClear;
	bool revoke;
	var peer;
	int maxId;


	DeleteHistory({this.justClear, this.revoke, this.peer, this.maxId});

	static DeleteHistory fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final justClear = false;final revoke = false;var peer = reader.tgReadObject();var maxId = reader.readInt();		return new DeleteHistory(justClear : justClear, revoke : revoke, peer : peer, maxId : maxId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(469850889,4),[0,0,0,0],(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.maxId,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class DeleteMessages {
    static const CONSTRUCTOR_ID = 3851326930;
    static const SUBCLASS_OF_ID = 3469983854;
    final classType = "request";
    final ID = 3851326930;
	bool revoke;
	List<int> id;


	DeleteMessages({this.revoke, this.id});

	static DeleteMessages fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final revoke = false;reader.readInt();
List<int> id = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		id.add(reader.readInt());
}		return new DeleteMessages(revoke : revoke, id : id);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3851326930,4),[0,0,0,0],readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.id.length,4,little:true,signed:true),this.id.map((x)=>readBufferFromBigInt(x,4,little:true,signed:true)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ReceivedMessages {
    static const CONSTRUCTOR_ID = 94983360;
    static const SUBCLASS_OF_ID = 2238052503;
    final classType = "request";
    final ID = 94983360;
	int maxId;


	ReceivedMessages({this.maxId});

	static ReceivedMessages fromReader(BinaryReader reader) {
	var temp,len;var maxId = reader.readInt();		return new ReceivedMessages(maxId : maxId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(94983360,4),readBufferFromBigInt(this.maxId,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SetTyping {
    static const CONSTRUCTOR_ID = 2743230032;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 2743230032;
	var peer;
	var action;


	SetTyping({this.peer, this.action});

	static SetTyping fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var action = reader.tgReadObject();		return new SetTyping(peer : peer, action : action);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2743230032,4),(this.peer.getBytes() as List<int>),(this.action.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SendMessage {
    static const CONSTRUCTOR_ID = 1376532592;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 1376532592;
	bool noWebpage;
	bool silent;
	bool background;
	bool clearDraft;
	var peer;
	int replyToMsgId;
	String message;
	BigInt randomId;
	var replyMarkup;
	List<dynamic> entities;
	int scheduleDate;


	SendMessage({this.noWebpage, this.silent, this.background, this.clearDraft, this.peer, this.replyToMsgId, this.message, this.randomId, this.replyMarkup, this.entities, this.scheduleDate});

	static SendMessage fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final noWebpage = false;final silent = false;final background = false;final clearDraft = false;var peer = reader.tgReadObject();var replyToMsgId;if ((flags & 1)==1){var replyToMsgId = reader.readInt(); } else {replyToMsgId=null;}var message = reader.tgReadString();var randomId = reader.readLong();var replyMarkup;if ((flags & 4)==1){var replyMarkup = reader.tgReadObject(); } else {replyMarkup=null;}var entities;if ((flags & 8)==1){reader.readInt();
List<dynamic> entities = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		entities.add(reader.tgReadObject());
} } else {entities=null;}var scheduleDate;if ((flags & 1024)==1){var scheduleDate = reader.readInt(); } else {scheduleDate=null;}		return new SendMessage(noWebpage : noWebpage, silent : silent, background : background, clearDraft : clearDraft, peer : peer, replyToMsgId : replyToMsgId, message : message, randomId : randomId, replyMarkup : replyMarkup, entities : entities, scheduleDate : scheduleDate);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1376532592,4),[0,0,0,0],(this.peer.getBytes() as List<int>),(this.replyToMsgId==null||this.replyToMsgId==false)?new List<int>():[readBufferFromBigInt(this.replyToMsgId,4,little:true,signed:true)].expand((element) => element).toList(),serializeBytes(this.message),readBufferFromBigInt(this.randomId,8,little:true,signed:true),(this.replyMarkup==null||this.replyMarkup==false)?new List<int>():[(this.replyMarkup.getBytes() as List<int>)].expand((element) => element).toList(),(this.entities==null||this.entities==false)?new List<int>():[readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.entities.length,4,little:true,signed:true),this.entities.map((x)=>(x.getBytes() as List<int>)).expand((element) => element)].expand((element) => element).toList(),(this.scheduleDate==null||this.scheduleDate==false)?new List<int>():[readBufferFromBigInt(this.scheduleDate,4,little:true,signed:true)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SendMedia {
    static const CONSTRUCTOR_ID = 881978281;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 881978281;
	bool silent;
	bool background;
	bool clearDraft;
	var peer;
	int replyToMsgId;
	var media;
	String message;
	BigInt randomId;
	var replyMarkup;
	List<dynamic> entities;
	int scheduleDate;


	SendMedia({this.silent, this.background, this.clearDraft, this.peer, this.replyToMsgId, this.media, this.message, this.randomId, this.replyMarkup, this.entities, this.scheduleDate});

	static SendMedia fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final silent = false;final background = false;final clearDraft = false;var peer = reader.tgReadObject();var replyToMsgId;if ((flags & 1)==1){var replyToMsgId = reader.readInt(); } else {replyToMsgId=null;}var media = reader.tgReadObject();var message = reader.tgReadString();var randomId = reader.readLong();var replyMarkup;if ((flags & 4)==1){var replyMarkup = reader.tgReadObject(); } else {replyMarkup=null;}var entities;if ((flags & 8)==1){reader.readInt();
List<dynamic> entities = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		entities.add(reader.tgReadObject());
} } else {entities=null;}var scheduleDate;if ((flags & 1024)==1){var scheduleDate = reader.readInt(); } else {scheduleDate=null;}		return new SendMedia(silent : silent, background : background, clearDraft : clearDraft, peer : peer, replyToMsgId : replyToMsgId, media : media, message : message, randomId : randomId, replyMarkup : replyMarkup, entities : entities, scheduleDate : scheduleDate);
	}
	List<int> getBytes(){return [readBufferFromBigInt(881978281,4),[0,0,0,0],(this.peer.getBytes() as List<int>),(this.replyToMsgId==null||this.replyToMsgId==false)?new List<int>():[readBufferFromBigInt(this.replyToMsgId,4,little:true,signed:true)].expand((element) => element).toList(),(this.media.getBytes() as List<int>),serializeBytes(this.message),readBufferFromBigInt(this.randomId,8,little:true,signed:true),(this.replyMarkup==null||this.replyMarkup==false)?new List<int>():[(this.replyMarkup.getBytes() as List<int>)].expand((element) => element).toList(),(this.entities==null||this.entities==false)?new List<int>():[readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.entities.length,4,little:true,signed:true),this.entities.map((x)=>(x.getBytes() as List<int>)).expand((element) => element)].expand((element) => element).toList(),(this.scheduleDate==null||this.scheduleDate==false)?new List<int>():[readBufferFromBigInt(this.scheduleDate,4,little:true,signed:true)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ForwardMessages {
    static const CONSTRUCTOR_ID = 3657360910;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 3657360910;
	bool silent;
	bool background;
	bool withMyScore;
	bool grouped;
	var fromPeer;
	List<int> id;
	List<BigInt> randomId;
	var toPeer;
	int scheduleDate;


	ForwardMessages({this.silent, this.background, this.withMyScore, this.grouped, this.fromPeer, this.id, this.randomId, this.toPeer, this.scheduleDate});

	static ForwardMessages fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final silent = false;final background = false;final withMyScore = false;final grouped = false;var fromPeer = reader.tgReadObject();reader.readInt();
List<int> id = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		id.add(reader.readInt());
}reader.readInt();
List<BigInt> randomId = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		randomId.add(reader.readLong());
}var toPeer = reader.tgReadObject();var scheduleDate;if ((flags & 1024)==1){var scheduleDate = reader.readInt(); } else {scheduleDate=null;}		return new ForwardMessages(silent : silent, background : background, withMyScore : withMyScore, grouped : grouped, fromPeer : fromPeer, id : id, randomId : randomId, toPeer : toPeer, scheduleDate : scheduleDate);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3657360910,4),[0,0,0,0],(this.fromPeer.getBytes() as List<int>),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.id.length,4,little:true,signed:true),this.id.map((x)=>readBufferFromBigInt(x,4,little:true,signed:true)).expand((element) => element),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.randomId.length,4,little:true,signed:true),this.randomId.map((x)=>readBufferFromBigInt(x,8,little:true,signed:true)).expand((element) => element),(this.toPeer.getBytes() as List<int>),(this.scheduleDate==null||this.scheduleDate==false)?new List<int>():[readBufferFromBigInt(this.scheduleDate,4,little:true,signed:true)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ReportSpam {
    static const CONSTRUCTOR_ID = 3474297563;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3474297563;
	var peer;


	ReportSpam({this.peer});

	static ReportSpam fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();		return new ReportSpam(peer : peer);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3474297563,4),(this.peer.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetPeerSettings {
    static const CONSTRUCTOR_ID = 913498268;
    static const SUBCLASS_OF_ID = 4138180484;
    final classType = "request";
    final ID = 913498268;
	var peer;


	GetPeerSettings({this.peer});

	static GetPeerSettings fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();		return new GetPeerSettings(peer : peer);
	}
	List<int> getBytes(){return [readBufferFromBigInt(913498268,4),(this.peer.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class Report {
    static const CONSTRUCTOR_ID = 3179460184;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3179460184;
	var peer;
	List<int> id;
	var reason;


	Report({this.peer, this.id, this.reason});

	static Report fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();reader.readInt();
List<int> id = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		id.add(reader.readInt());
}var reason = reader.tgReadObject();		return new Report(peer : peer, id : id, reason : reason);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3179460184,4),(this.peer.getBytes() as List<int>),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.id.length,4,little:true,signed:true),this.id.map((x)=>readBufferFromBigInt(x,4,little:true,signed:true)).expand((element) => element),(this.reason.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetChats {
    static const CONSTRUCTOR_ID = 1013621127;
    static const SUBCLASS_OF_ID = 2580925204;
    final classType = "request";
    final ID = 1013621127;
	List<int> id;


	GetChats({this.id});

	static GetChats fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<int> id = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		id.add(reader.readInt());
}		return new GetChats(id : id);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1013621127,4),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.id.length,4,little:true,signed:true),this.id.map((x)=>readBufferFromBigInt(x,4,little:true,signed:true)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetFullChat {
    static const CONSTRUCTOR_ID = 998448230;
    static const SUBCLASS_OF_ID = 576344329;
    final classType = "request";
    final ID = 998448230;
	int chatId;


	GetFullChat({this.chatId});

	static GetFullChat fromReader(BinaryReader reader) {
	var temp,len;var chatId = reader.readInt();		return new GetFullChat(chatId : chatId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(998448230,4),readBufferFromBigInt(this.chatId,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class EditChatTitle {
    static const CONSTRUCTOR_ID = 3695519829;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 3695519829;
	int chatId;
	String title;


	EditChatTitle({this.chatId, this.title});

	static EditChatTitle fromReader(BinaryReader reader) {
	var temp,len;var chatId = reader.readInt();var title = reader.tgReadString();		return new EditChatTitle(chatId : chatId, title : title);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3695519829,4),readBufferFromBigInt(this.chatId,4,little:true,signed:true),serializeBytes(this.title),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class EditChatPhoto {
    static const CONSTRUCTOR_ID = 3394009560;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 3394009560;
	int chatId;
	var photo;


	EditChatPhoto({this.chatId, this.photo});

	static EditChatPhoto fromReader(BinaryReader reader) {
	var temp,len;var chatId = reader.readInt();var photo = reader.tgReadObject();		return new EditChatPhoto(chatId : chatId, photo : photo);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3394009560,4),readBufferFromBigInt(this.chatId,4,little:true,signed:true),(this.photo.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class AddChatUser {
    static const CONSTRUCTOR_ID = 4188056073;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 4188056073;
	int chatId;
	var userId;
	int fwdLimit;


	AddChatUser({this.chatId, this.userId, this.fwdLimit});

	static AddChatUser fromReader(BinaryReader reader) {
	var temp,len;var chatId = reader.readInt();var userId = reader.tgReadObject();var fwdLimit = reader.readInt();		return new AddChatUser(chatId : chatId, userId : userId, fwdLimit : fwdLimit);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4188056073,4),readBufferFromBigInt(this.chatId,4,little:true,signed:true),(this.userId.getBytes() as List<int>),readBufferFromBigInt(this.fwdLimit,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class DeleteChatUser {
    static const CONSTRUCTOR_ID = 3764461334;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 3764461334;
	int chatId;
	var userId;


	DeleteChatUser({this.chatId, this.userId});

	static DeleteChatUser fromReader(BinaryReader reader) {
	var temp,len;var chatId = reader.readInt();var userId = reader.tgReadObject();		return new DeleteChatUser(chatId : chatId, userId : userId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3764461334,4),readBufferFromBigInt(this.chatId,4,little:true,signed:true),(this.userId.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class CreateChat {
    static const CONSTRUCTOR_ID = 164303470;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 164303470;
	List<dynamic> users;
	String title;


	CreateChat({this.users, this.title});

	static CreateChat fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<dynamic> users = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		users.add(reader.tgReadObject());
}var title = reader.tgReadString();		return new CreateChat(users : users, title : title);
	}
	List<int> getBytes(){return [readBufferFromBigInt(164303470,4),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.users.length,4,little:true,signed:true),this.users.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),serializeBytes(this.title),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetDhConfig {
    static const CONSTRUCTOR_ID = 651135312;
    static const SUBCLASS_OF_ID = 3834178955;
    final classType = "request";
    final ID = 651135312;
	int version;
	int randomLength;


	GetDhConfig({this.version, this.randomLength});

	static GetDhConfig fromReader(BinaryReader reader) {
	var temp,len;var version = reader.readInt();var randomLength = reader.readInt();		return new GetDhConfig(version : version, randomLength : randomLength);
	}
	List<int> getBytes(){return [readBufferFromBigInt(651135312,4),readBufferFromBigInt(this.version,4,little:true,signed:true),readBufferFromBigInt(this.randomLength,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class RequestEncryption {
    static const CONSTRUCTOR_ID = 4132286275;
    static const SUBCLASS_OF_ID = 1831379834;
    final classType = "request";
    final ID = 4132286275;
	var userId;
	int randomId;
	List<int> gA;


	RequestEncryption({this.userId, this.randomId, this.gA});

	static RequestEncryption fromReader(BinaryReader reader) {
	var temp,len;var userId = reader.tgReadObject();var randomId = reader.readInt();var gA = reader.tgReadBytes();		return new RequestEncryption(userId : userId, randomId : randomId, gA : gA);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4132286275,4),(this.userId.getBytes() as List<int>),readBufferFromBigInt(this.randomId,4,little:true,signed:true),serializeBytes(this.gA),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class AcceptEncryption {
    static const CONSTRUCTOR_ID = 1035731989;
    static const SUBCLASS_OF_ID = 1831379834;
    final classType = "request";
    final ID = 1035731989;
	var peer;
	List<int> gB;
	BigInt keyFingerprint;


	AcceptEncryption({this.peer, this.gB, this.keyFingerprint});

	static AcceptEncryption fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var gB = reader.tgReadBytes();var keyFingerprint = reader.readLong();		return new AcceptEncryption(peer : peer, gB : gB, keyFingerprint : keyFingerprint);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1035731989,4),(this.peer.getBytes() as List<int>),serializeBytes(this.gB),readBufferFromBigInt(this.keyFingerprint,8,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class DiscardEncryption {
    static const CONSTRUCTOR_ID = 3990430661;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3990430661;
	int chatId;


	DiscardEncryption({this.chatId});

	static DiscardEncryption fromReader(BinaryReader reader) {
	var temp,len;var chatId = reader.readInt();		return new DiscardEncryption(chatId : chatId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3990430661,4),readBufferFromBigInt(this.chatId,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SetEncryptedTyping {
    static const CONSTRUCTOR_ID = 2031374829;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 2031374829;
	var peer;
	bool typing;


	SetEncryptedTyping({this.peer, this.typing});

	static SetEncryptedTyping fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var typing = reader.tgReadBool();		return new SetEncryptedTyping(peer : peer, typing : typing);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2031374829,4),(this.peer.getBytes() as List<int>),[this.typing ? 0xb5757299 : 0x379779bc],].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ReadEncryptedHistory {
    static const CONSTRUCTOR_ID = 2135648522;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 2135648522;
	var peer;
	int maxDate;


	ReadEncryptedHistory({this.peer, this.maxDate});

	static ReadEncryptedHistory fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var maxDate = reader.readInt();		return new ReadEncryptedHistory(peer : peer, maxDate : maxDate);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2135648522,4),(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.maxDate,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SendEncrypted {
    static const CONSTRUCTOR_ID = 2843174771;
    static const SUBCLASS_OF_ID = 3382591056;
    final classType = "request";
    final ID = 2843174771;
	var peer;
	BigInt randomId;
	List<int> data;


	SendEncrypted({this.peer, this.randomId, this.data});

	static SendEncrypted fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var randomId = reader.readLong();var data = reader.tgReadBytes();		return new SendEncrypted(peer : peer, randomId : randomId, data : data);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2843174771,4),(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.randomId,8,little:true,signed:true),serializeBytes(this.data),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SendEncryptedFile {
    static const CONSTRUCTOR_ID = 2593135462;
    static const SUBCLASS_OF_ID = 3382591056;
    final classType = "request";
    final ID = 2593135462;
	var peer;
	BigInt randomId;
	List<int> data;
	var file;


	SendEncryptedFile({this.peer, this.randomId, this.data, this.file});

	static SendEncryptedFile fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var randomId = reader.readLong();var data = reader.tgReadBytes();var file = reader.tgReadObject();		return new SendEncryptedFile(peer : peer, randomId : randomId, data : data, file : file);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2593135462,4),(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.randomId,8,little:true,signed:true),serializeBytes(this.data),(this.file.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SendEncryptedService {
    static const CONSTRUCTOR_ID = 852769188;
    static const SUBCLASS_OF_ID = 3382591056;
    final classType = "request";
    final ID = 852769188;
	var peer;
	BigInt randomId;
	List<int> data;


	SendEncryptedService({this.peer, this.randomId, this.data});

	static SendEncryptedService fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var randomId = reader.readLong();var data = reader.tgReadBytes();		return new SendEncryptedService(peer : peer, randomId : randomId, data : data);
	}
	List<int> getBytes(){return [readBufferFromBigInt(852769188,4),(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.randomId,8,little:true,signed:true),serializeBytes(this.data),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ReceivedQueue {
    static const CONSTRUCTOR_ID = 1436924774;
    static const SUBCLASS_OF_ID = 2300109160;
    final classType = "request";
    final ID = 1436924774;
	int maxQts;


	ReceivedQueue({this.maxQts});

	static ReceivedQueue fromReader(BinaryReader reader) {
	var temp,len;var maxQts = reader.readInt();		return new ReceivedQueue(maxQts : maxQts);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1436924774,4),readBufferFromBigInt(this.maxQts,4,little:true,signed:true),].expand((element) => element).toList();}
	List<BigInt> readResult(BinaryReader reader) {
	
reader.readInt();
final range = reader.readInt();
final List<BigInt> result = [];
 for (int i=0;i<range;i++){
	result.add(reader.readLong());}
	}

}

class ReportEncryptedSpam {
    static const CONSTRUCTOR_ID = 1259113487;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 1259113487;
	var peer;


	ReportEncryptedSpam({this.peer});

	static ReportEncryptedSpam fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();		return new ReportEncryptedSpam(peer : peer);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1259113487,4),(this.peer.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ReadMessageContents {
    static const CONSTRUCTOR_ID = 916930423;
    static const SUBCLASS_OF_ID = 3469983854;
    final classType = "request";
    final ID = 916930423;
	List<int> id;


	ReadMessageContents({this.id});

	static ReadMessageContents fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<int> id = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		id.add(reader.readInt());
}		return new ReadMessageContents(id : id);
	}
	List<int> getBytes(){return [readBufferFromBigInt(916930423,4),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.id.length,4,little:true,signed:true),this.id.map((x)=>readBufferFromBigInt(x,4,little:true,signed:true)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetStickers {
    static const CONSTRUCTOR_ID = 71126828;
    static const SUBCLASS_OF_ID = 3611015646;
    final classType = "request";
    final ID = 71126828;
	String emoticon;
	int hash;


	GetStickers({this.emoticon, this.hash});

	static GetStickers fromReader(BinaryReader reader) {
	var temp,len;var emoticon = reader.tgReadString();var hash = reader.readInt();		return new GetStickers(emoticon : emoticon, hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(71126828,4),serializeBytes(this.emoticon),readBufferFromBigInt(this.hash,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetAllStickers {
    static const CONSTRUCTOR_ID = 479598769;
    static const SUBCLASS_OF_ID = 1166231593;
    final classType = "request";
    final ID = 479598769;
	int hash;


	GetAllStickers({this.hash});

	static GetAllStickers fromReader(BinaryReader reader) {
	var temp,len;var hash = reader.readInt();		return new GetAllStickers(hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(479598769,4),readBufferFromBigInt(this.hash,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetWebPagePreview {
    static const CONSTRUCTOR_ID = 2338894028;
    static const SUBCLASS_OF_ID = 1198308914;
    final classType = "request";
    final ID = 2338894028;
	String message;
	List<dynamic> entities;


	GetWebPagePreview({this.message, this.entities});

	static GetWebPagePreview fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();var message = reader.tgReadString();var entities;if ((flags & 8)==1){reader.readInt();
List<dynamic> entities = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		entities.add(reader.tgReadObject());
} } else {entities=null;}		return new GetWebPagePreview(message : message, entities : entities);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2338894028,4),[0,0,0,0],serializeBytes(this.message),(this.entities==null||this.entities==false)?new List<int>():[readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.entities.length,4,little:true,signed:true),this.entities.map((x)=>(x.getBytes() as List<int>)).expand((element) => element)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ExportChatInvite {
    static const CONSTRUCTOR_ID = 234312524;
    static const SUBCLASS_OF_ID = 3027536472;
    final classType = "request";
    final ID = 234312524;
	var peer;


	ExportChatInvite({this.peer});

	static ExportChatInvite fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();		return new ExportChatInvite(peer : peer);
	}
	List<int> getBytes(){return [readBufferFromBigInt(234312524,4),(this.peer.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class CheckChatInvite {
    static const CONSTRUCTOR_ID = 1051570619;
    static const SUBCLASS_OF_ID = 72750902;
    final classType = "request";
    final ID = 1051570619;
	String hash;


	CheckChatInvite({this.hash});

	static CheckChatInvite fromReader(BinaryReader reader) {
	var temp,len;var hash = reader.tgReadString();		return new CheckChatInvite(hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1051570619,4),serializeBytes(this.hash),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ImportChatInvite {
    static const CONSTRUCTOR_ID = 1817183516;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 1817183516;
	String hash;


	ImportChatInvite({this.hash});

	static ImportChatInvite fromReader(BinaryReader reader) {
	var temp,len;var hash = reader.tgReadString();		return new ImportChatInvite(hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1817183516,4),serializeBytes(this.hash),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetStickerSet {
    static const CONSTRUCTOR_ID = 639215886;
    static const SUBCLASS_OF_ID = 2607827546;
    final classType = "request";
    final ID = 639215886;
	var stickerset;


	GetStickerSet({this.stickerset});

	static GetStickerSet fromReader(BinaryReader reader) {
	var temp,len;var stickerset = reader.tgReadObject();		return new GetStickerSet(stickerset : stickerset);
	}
	List<int> getBytes(){return [readBufferFromBigInt(639215886,4),(this.stickerset.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class InstallStickerSet {
    static const CONSTRUCTOR_ID = 3348096096;
    static const SUBCLASS_OF_ID = 1741373416;
    final classType = "request";
    final ID = 3348096096;
	var stickerset;
	bool archived;


	InstallStickerSet({this.stickerset, this.archived});

	static InstallStickerSet fromReader(BinaryReader reader) {
	var temp,len;var stickerset = reader.tgReadObject();var archived = reader.tgReadBool();		return new InstallStickerSet(stickerset : stickerset, archived : archived);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3348096096,4),(this.stickerset.getBytes() as List<int>),[this.archived ? 0xb5757299 : 0x379779bc],].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class UninstallStickerSet {
    static const CONSTRUCTOR_ID = 4184757726;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 4184757726;
	var stickerset;


	UninstallStickerSet({this.stickerset});

	static UninstallStickerSet fromReader(BinaryReader reader) {
	var temp,len;var stickerset = reader.tgReadObject();		return new UninstallStickerSet(stickerset : stickerset);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4184757726,4),(this.stickerset.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class StartBot {
    static const CONSTRUCTOR_ID = 3873403768;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 3873403768;
	var bot;
	var peer;
	BigInt randomId;
	String startParam;


	StartBot({this.bot, this.peer, this.randomId, this.startParam});

	static StartBot fromReader(BinaryReader reader) {
	var temp,len;var bot = reader.tgReadObject();var peer = reader.tgReadObject();var randomId = reader.readLong();var startParam = reader.tgReadString();		return new StartBot(bot : bot, peer : peer, randomId : randomId, startParam : startParam);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3873403768,4),(this.bot.getBytes() as List<int>),(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.randomId,8,little:true,signed:true),serializeBytes(this.startParam),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetMessagesViews {
    static const CONSTRUCTOR_ID = 3301483869;
    static const SUBCLASS_OF_ID = 1344696591;
    final classType = "request";
    final ID = 3301483869;
	var peer;
	List<int> id;
	bool increment;


	GetMessagesViews({this.peer, this.id, this.increment});

	static GetMessagesViews fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();reader.readInt();
List<int> id = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		id.add(reader.readInt());
}var increment = reader.tgReadBool();		return new GetMessagesViews(peer : peer, id : id, increment : increment);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3301483869,4),(this.peer.getBytes() as List<int>),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.id.length,4,little:true,signed:true),this.id.map((x)=>readBufferFromBigInt(x,4,little:true,signed:true)).expand((element) => element),[this.increment ? 0xb5757299 : 0x379779bc],].expand((element) => element).toList();}
	List<int> readResult(BinaryReader reader) {
	
reader.readInt();
final range = reader.readInt();
final List<int> result = [];
 for (int i=0;i<range;i++){
	result.add(reader.readInt());}
	}

}

class EditChatAdmin {
    static const CONSTRUCTOR_ID = 2850463534;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 2850463534;
	int chatId;
	var userId;
	bool isAdmin;


	EditChatAdmin({this.chatId, this.userId, this.isAdmin});

	static EditChatAdmin fromReader(BinaryReader reader) {
	var temp,len;var chatId = reader.readInt();var userId = reader.tgReadObject();var isAdmin = reader.tgReadBool();		return new EditChatAdmin(chatId : chatId, userId : userId, isAdmin : isAdmin);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2850463534,4),readBufferFromBigInt(this.chatId,4,little:true,signed:true),(this.userId.getBytes() as List<int>),[this.isAdmin ? 0xb5757299 : 0x379779bc],].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class MigrateChat {
    static const CONSTRUCTOR_ID = 363051235;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 363051235;
	int chatId;


	MigrateChat({this.chatId});

	static MigrateChat fromReader(BinaryReader reader) {
	var temp,len;var chatId = reader.readInt();		return new MigrateChat(chatId : chatId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(363051235,4),readBufferFromBigInt(this.chatId,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SearchGlobal {
    static const CONSTRUCTOR_ID = 3211928996;
    static const SUBCLASS_OF_ID = 3568569182;
    final classType = "request";
    final ID = 3211928996;
	int folderId;
	String q;
	int offsetRate;
	var offsetPeer;
	int offsetId;
	int limit;


	SearchGlobal({this.folderId, this.q, this.offsetRate, this.offsetPeer, this.offsetId, this.limit});

	static SearchGlobal fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();var folderId;if ((flags & 1)==1){var folderId = reader.readInt(); } else {folderId=null;}var q = reader.tgReadString();var offsetRate = reader.readInt();var offsetPeer = reader.tgReadObject();var offsetId = reader.readInt();var limit = reader.readInt();		return new SearchGlobal(folderId : folderId, q : q, offsetRate : offsetRate, offsetPeer : offsetPeer, offsetId : offsetId, limit : limit);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3211928996,4),[0,0,0,0],(this.folderId==null||this.folderId==false)?new List<int>():[readBufferFromBigInt(this.folderId,4,little:true,signed:true)].expand((element) => element).toList(),serializeBytes(this.q),readBufferFromBigInt(this.offsetRate,4,little:true,signed:true),(this.offsetPeer.getBytes() as List<int>),readBufferFromBigInt(this.offsetId,4,little:true,signed:true),readBufferFromBigInt(this.limit,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ReorderStickerSets {
    static const CONSTRUCTOR_ID = 2016638777;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 2016638777;
	bool masks;
	List<BigInt> order;


	ReorderStickerSets({this.masks, this.order});

	static ReorderStickerSets fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final masks = false;reader.readInt();
List<BigInt> order = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		order.add(reader.readLong());
}		return new ReorderStickerSets(masks : masks, order : order);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2016638777,4),[0,0,0,0],readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.order.length,4,little:true,signed:true),this.order.map((x)=>readBufferFromBigInt(x,8,little:true,signed:true)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetDocumentByHash {
    static const CONSTRUCTOR_ID = 864953444;
    static const SUBCLASS_OF_ID = 555739168;
    final classType = "request";
    final ID = 864953444;
	List<int> sha256;
	int size;
	String mimeType;


	GetDocumentByHash({this.sha256, this.size, this.mimeType});

	static GetDocumentByHash fromReader(BinaryReader reader) {
	var temp,len;var sha256 = reader.tgReadBytes();var size = reader.readInt();var mimeType = reader.tgReadString();		return new GetDocumentByHash(sha256 : sha256, size : size, mimeType : mimeType);
	}
	List<int> getBytes(){return [readBufferFromBigInt(864953444,4),serializeBytes(this.sha256),readBufferFromBigInt(this.size,4,little:true,signed:true),serializeBytes(this.mimeType),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SearchGifs {
    static const CONSTRUCTOR_ID = 3214571371;
    static const SUBCLASS_OF_ID = 242851495;
    final classType = "request";
    final ID = 3214571371;
	String q;
	int offset;


	SearchGifs({this.q, this.offset});

	static SearchGifs fromReader(BinaryReader reader) {
	var temp,len;var q = reader.tgReadString();var offset = reader.readInt();		return new SearchGifs(q : q, offset : offset);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3214571371,4),serializeBytes(this.q),readBufferFromBigInt(this.offset,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetSavedGifs {
    static const CONSTRUCTOR_ID = 2210348370;
    static const SUBCLASS_OF_ID = 2794152437;
    final classType = "request";
    final ID = 2210348370;
	int hash;


	GetSavedGifs({this.hash});

	static GetSavedGifs fromReader(BinaryReader reader) {
	var temp,len;var hash = reader.readInt();		return new GetSavedGifs(hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2210348370,4),readBufferFromBigInt(this.hash,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SaveGif {
    static const CONSTRUCTOR_ID = 846868683;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 846868683;
	var id;
	bool unsave;


	SaveGif({this.id, this.unsave});

	static SaveGif fromReader(BinaryReader reader) {
	var temp,len;var id = reader.tgReadObject();var unsave = reader.tgReadBool();		return new SaveGif(id : id, unsave : unsave);
	}
	List<int> getBytes(){return [readBufferFromBigInt(846868683,4),(this.id.getBytes() as List<int>),[this.unsave ? 0xb5757299 : 0x379779bc],].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetInlineBotResults {
    static const CONSTRUCTOR_ID = 1364105629;
    static const SUBCLASS_OF_ID = 1054136777;
    final classType = "request";
    final ID = 1364105629;
	var bot;
	var peer;
	var geoPoint;
	String query;
	String offset;


	GetInlineBotResults({this.bot, this.peer, this.geoPoint, this.query, this.offset});

	static GetInlineBotResults fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();var bot = reader.tgReadObject();var peer = reader.tgReadObject();var geoPoint;if ((flags & 1)==1){var geoPoint = reader.tgReadObject(); } else {geoPoint=null;}var query = reader.tgReadString();var offset = reader.tgReadString();		return new GetInlineBotResults(bot : bot, peer : peer, geoPoint : geoPoint, query : query, offset : offset);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1364105629,4),[0,0,0,0],(this.bot.getBytes() as List<int>),(this.peer.getBytes() as List<int>),(this.geoPoint==null||this.geoPoint==false)?new List<int>():[(this.geoPoint.getBytes() as List<int>)].expand((element) => element).toList(),serializeBytes(this.query),serializeBytes(this.offset),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SetInlineBotResults {
    static const CONSTRUCTOR_ID = 3948847622;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3948847622;
	bool gallery;
	bool private;
	BigInt queryId;
	List<dynamic> results;
	int cacheTime;
	String nextOffset;
	var switchPm;


	SetInlineBotResults({this.gallery, this.private, this.queryId, this.results, this.cacheTime, this.nextOffset, this.switchPm});

	static SetInlineBotResults fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final gallery = false;final private = false;var queryId = reader.readLong();reader.readInt();
List<dynamic> results = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		results.add(reader.tgReadObject());
}var cacheTime = reader.readInt();var nextOffset;if ((flags & 4)==1){var nextOffset = reader.tgReadString(); } else {nextOffset=null;}var switchPm;if ((flags & 8)==1){var switchPm = reader.tgReadObject(); } else {switchPm=null;}		return new SetInlineBotResults(gallery : gallery, private : private, queryId : queryId, results : results, cacheTime : cacheTime, nextOffset : nextOffset, switchPm : switchPm);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3948847622,4),[0,0,0,0],readBufferFromBigInt(this.queryId,8,little:true,signed:true),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.results.length,4,little:true,signed:true),this.results.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),readBufferFromBigInt(this.cacheTime,4,little:true,signed:true),(this.nextOffset==null||this.nextOffset==false)?new List<int>():[serializeBytes(this.nextOffset)].expand((element) => element).toList(),(this.switchPm==null||this.switchPm==false)?new List<int>():[(this.switchPm.getBytes() as List<int>)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SendInlineBotResult {
    static const CONSTRUCTOR_ID = 570955184;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 570955184;
	bool silent;
	bool background;
	bool clearDraft;
	bool hideVia;
	var peer;
	int replyToMsgId;
	BigInt randomId;
	BigInt queryId;
	String id;
	int scheduleDate;


	SendInlineBotResult({this.silent, this.background, this.clearDraft, this.hideVia, this.peer, this.replyToMsgId, this.randomId, this.queryId, this.id, this.scheduleDate});

	static SendInlineBotResult fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final silent = false;final background = false;final clearDraft = false;final hideVia = false;var peer = reader.tgReadObject();var replyToMsgId;if ((flags & 1)==1){var replyToMsgId = reader.readInt(); } else {replyToMsgId=null;}var randomId = reader.readLong();var queryId = reader.readLong();var id = reader.tgReadString();var scheduleDate;if ((flags & 1024)==1){var scheduleDate = reader.readInt(); } else {scheduleDate=null;}		return new SendInlineBotResult(silent : silent, background : background, clearDraft : clearDraft, hideVia : hideVia, peer : peer, replyToMsgId : replyToMsgId, randomId : randomId, queryId : queryId, id : id, scheduleDate : scheduleDate);
	}
	List<int> getBytes(){return [readBufferFromBigInt(570955184,4),[0,0,0,0],(this.peer.getBytes() as List<int>),(this.replyToMsgId==null||this.replyToMsgId==false)?new List<int>():[readBufferFromBigInt(this.replyToMsgId,4,little:true,signed:true)].expand((element) => element).toList(),readBufferFromBigInt(this.randomId,8,little:true,signed:true),readBufferFromBigInt(this.queryId,8,little:true,signed:true),serializeBytes(this.id),(this.scheduleDate==null||this.scheduleDate==false)?new List<int>():[readBufferFromBigInt(this.scheduleDate,4,little:true,signed:true)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetMessageEditData {
    static const CONSTRUCTOR_ID = 4255550774;
    static const SUBCLASS_OF_ID = 4215772317;
    final classType = "request";
    final ID = 4255550774;
	var peer;
	int id;


	GetMessageEditData({this.peer, this.id});

	static GetMessageEditData fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var id = reader.readInt();		return new GetMessageEditData(peer : peer, id : id);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4255550774,4),(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.id,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class EditMessage {
    static const CONSTRUCTOR_ID = 1224152952;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 1224152952;
	bool noWebpage;
	var peer;
	int id;
	String message;
	var media;
	var replyMarkup;
	List<dynamic> entities;
	int scheduleDate;


	EditMessage({this.noWebpage, this.peer, this.id, this.message, this.media, this.replyMarkup, this.entities, this.scheduleDate});

	static EditMessage fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final noWebpage = false;var peer = reader.tgReadObject();var id = reader.readInt();var message;if ((flags & 2048)==1){var message = reader.tgReadString(); } else {message=null;}var media;if ((flags & 16384)==1){var media = reader.tgReadObject(); } else {media=null;}var replyMarkup;if ((flags & 4)==1){var replyMarkup = reader.tgReadObject(); } else {replyMarkup=null;}var entities;if ((flags & 8)==1){reader.readInt();
List<dynamic> entities = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		entities.add(reader.tgReadObject());
} } else {entities=null;}var scheduleDate;if ((flags & 32768)==1){var scheduleDate = reader.readInt(); } else {scheduleDate=null;}		return new EditMessage(noWebpage : noWebpage, peer : peer, id : id, message : message, media : media, replyMarkup : replyMarkup, entities : entities, scheduleDate : scheduleDate);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1224152952,4),[0,0,0,0],(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.id,4,little:true,signed:true),(this.message==null||this.message==false)?new List<int>():[serializeBytes(this.message)].expand((element) => element).toList(),(this.media==null||this.media==false)?new List<int>():[(this.media.getBytes() as List<int>)].expand((element) => element).toList(),(this.replyMarkup==null||this.replyMarkup==false)?new List<int>():[(this.replyMarkup.getBytes() as List<int>)].expand((element) => element).toList(),(this.entities==null||this.entities==false)?new List<int>():[readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.entities.length,4,little:true,signed:true),this.entities.map((x)=>(x.getBytes() as List<int>)).expand((element) => element)].expand((element) => element).toList(),(this.scheduleDate==null||this.scheduleDate==false)?new List<int>():[readBufferFromBigInt(this.scheduleDate,4,little:true,signed:true)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class EditInlineBotMessage {
    static const CONSTRUCTOR_ID = 2203418042;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 2203418042;
	bool noWebpage;
	var id;
	String message;
	var media;
	var replyMarkup;
	List<dynamic> entities;


	EditInlineBotMessage({this.noWebpage, this.id, this.message, this.media, this.replyMarkup, this.entities});

	static EditInlineBotMessage fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final noWebpage = false;var id = reader.tgReadObject();var message;if ((flags & 2048)==1){var message = reader.tgReadString(); } else {message=null;}var media;if ((flags & 16384)==1){var media = reader.tgReadObject(); } else {media=null;}var replyMarkup;if ((flags & 4)==1){var replyMarkup = reader.tgReadObject(); } else {replyMarkup=null;}var entities;if ((flags & 8)==1){reader.readInt();
List<dynamic> entities = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		entities.add(reader.tgReadObject());
} } else {entities=null;}		return new EditInlineBotMessage(noWebpage : noWebpage, id : id, message : message, media : media, replyMarkup : replyMarkup, entities : entities);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2203418042,4),[0,0,0,0],(this.id.getBytes() as List<int>),(this.message==null||this.message==false)?new List<int>():[serializeBytes(this.message)].expand((element) => element).toList(),(this.media==null||this.media==false)?new List<int>():[(this.media.getBytes() as List<int>)].expand((element) => element).toList(),(this.replyMarkup==null||this.replyMarkup==false)?new List<int>():[(this.replyMarkup.getBytes() as List<int>)].expand((element) => element).toList(),(this.entities==null||this.entities==false)?new List<int>():[readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.entities.length,4,little:true,signed:true),this.entities.map((x)=>(x.getBytes() as List<int>)).expand((element) => element)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetBotCallbackAnswer {
    static const CONSTRUCTOR_ID = 2164957164;
    static const SUBCLASS_OF_ID = 1817039244;
    final classType = "request";
    final ID = 2164957164;
	bool game;
	var peer;
	int msgId;
	List<int> data;


	GetBotCallbackAnswer({this.game, this.peer, this.msgId, this.data});

	static GetBotCallbackAnswer fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final game = false;var peer = reader.tgReadObject();var msgId = reader.readInt();var data;if ((flags & 1)==1){var data = reader.tgReadBytes(); } else {data=null;}		return new GetBotCallbackAnswer(game : game, peer : peer, msgId : msgId, data : data);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2164957164,4),[0,0,0,0],(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.msgId,4,little:true,signed:true),(this.data==null||this.data==false)?new List<int>():[serializeBytes(this.data)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SetBotCallbackAnswer {
    static const CONSTRUCTOR_ID = 3582923530;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3582923530;
	bool alert;
	BigInt queryId;
	String message;
	String url;
	int cacheTime;


	SetBotCallbackAnswer({this.alert, this.queryId, this.message, this.url, this.cacheTime});

	static SetBotCallbackAnswer fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final alert = false;var queryId = reader.readLong();var message;if ((flags & 1)==1){var message = reader.tgReadString(); } else {message=null;}var url;if ((flags & 4)==1){var url = reader.tgReadString(); } else {url=null;}var cacheTime = reader.readInt();		return new SetBotCallbackAnswer(alert : alert, queryId : queryId, message : message, url : url, cacheTime : cacheTime);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3582923530,4),[0,0,0,0],readBufferFromBigInt(this.queryId,8,little:true,signed:true),(this.message==null||this.message==false)?new List<int>():[serializeBytes(this.message)].expand((element) => element).toList(),(this.url==null||this.url==false)?new List<int>():[serializeBytes(this.url)].expand((element) => element).toList(),readBufferFromBigInt(this.cacheTime,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetPeerDialogs {
    static const CONSTRUCTOR_ID = 3832593661;
    static const SUBCLASS_OF_ID = 986120498;
    final classType = "request";
    final ID = 3832593661;
	List<dynamic> peers;


	GetPeerDialogs({this.peers});

	static GetPeerDialogs fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<dynamic> peers = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		peers.add(reader.tgReadObject());
}		return new GetPeerDialogs(peers : peers);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3832593661,4),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.peers.length,4,little:true,signed:true),this.peers.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SaveDraft {
    static const CONSTRUCTOR_ID = 3157909835;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3157909835;
	bool noWebpage;
	int replyToMsgId;
	var peer;
	String message;
	List<dynamic> entities;


	SaveDraft({this.noWebpage, this.replyToMsgId, this.peer, this.message, this.entities});

	static SaveDraft fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final noWebpage = false;var replyToMsgId;if ((flags & 1)==1){var replyToMsgId = reader.readInt(); } else {replyToMsgId=null;}var peer = reader.tgReadObject();var message = reader.tgReadString();var entities;if ((flags & 8)==1){reader.readInt();
List<dynamic> entities = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		entities.add(reader.tgReadObject());
} } else {entities=null;}		return new SaveDraft(noWebpage : noWebpage, replyToMsgId : replyToMsgId, peer : peer, message : message, entities : entities);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3157909835,4),[0,0,0,0],(this.replyToMsgId==null||this.replyToMsgId==false)?new List<int>():[readBufferFromBigInt(this.replyToMsgId,4,little:true,signed:true)].expand((element) => element).toList(),(this.peer.getBytes() as List<int>),serializeBytes(this.message),(this.entities==null||this.entities==false)?new List<int>():[readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.entities.length,4,little:true,signed:true),this.entities.map((x)=>(x.getBytes() as List<int>)).expand((element) => element)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetAllDrafts {
    static const CONSTRUCTOR_ID = 1782549861;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 1782549861;


	GetAllDrafts();

	static GetAllDrafts fromReader(BinaryReader reader) {
	var temp,len;		return new GetAllDrafts();
	}
	List<int> getBytes(){return [readBufferFromBigInt(1782549861,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetFeaturedStickers {
    static const CONSTRUCTOR_ID = 766298703;
    static const SUBCLASS_OF_ID = 638891810;
    final classType = "request";
    final ID = 766298703;
	int hash;


	GetFeaturedStickers({this.hash});

	static GetFeaturedStickers fromReader(BinaryReader reader) {
	var temp,len;var hash = reader.readInt();		return new GetFeaturedStickers(hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(766298703,4),readBufferFromBigInt(this.hash,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ReadFeaturedStickers {
    static const CONSTRUCTOR_ID = 1527873830;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 1527873830;
	List<BigInt> id;


	ReadFeaturedStickers({this.id});

	static ReadFeaturedStickers fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<BigInt> id = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		id.add(reader.readLong());
}		return new ReadFeaturedStickers(id : id);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1527873830,4),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.id.length,4,little:true,signed:true),this.id.map((x)=>readBufferFromBigInt(x,8,little:true,signed:true)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetRecentStickers {
    static const CONSTRUCTOR_ID = 1587647177;
    static const SUBCLASS_OF_ID = 4151281283;
    final classType = "request";
    final ID = 1587647177;
	bool attached;
	int hash;


	GetRecentStickers({this.attached, this.hash});

	static GetRecentStickers fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final attached = false;var hash = reader.readInt();		return new GetRecentStickers(attached : attached, hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1587647177,4),[0,0,0,0],readBufferFromBigInt(this.hash,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SaveRecentSticker {
    static const CONSTRUCTOR_ID = 958863608;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 958863608;
	bool attached;
	var id;
	bool unsave;


	SaveRecentSticker({this.attached, this.id, this.unsave});

	static SaveRecentSticker fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final attached = false;var id = reader.tgReadObject();var unsave = reader.tgReadBool();		return new SaveRecentSticker(attached : attached, id : id, unsave : unsave);
	}
	List<int> getBytes(){return [readBufferFromBigInt(958863608,4),[0,0,0,0],(this.id.getBytes() as List<int>),[this.unsave ? 0xb5757299 : 0x379779bc],].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ClearRecentStickers {
    static const CONSTRUCTOR_ID = 2308530221;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 2308530221;
	bool attached;


	ClearRecentStickers({this.attached});

	static ClearRecentStickers fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final attached = false;		return new ClearRecentStickers(attached : attached);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2308530221,4),[0,0,0,0],].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetArchivedStickers {
    static const CONSTRUCTOR_ID = 1475442322;
    static const SUBCLASS_OF_ID = 1922488177;
    final classType = "request";
    final ID = 1475442322;
	bool masks;
	BigInt offsetId;
	int limit;


	GetArchivedStickers({this.masks, this.offsetId, this.limit});

	static GetArchivedStickers fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final masks = false;var offsetId = reader.readLong();var limit = reader.readInt();		return new GetArchivedStickers(masks : masks, offsetId : offsetId, limit : limit);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1475442322,4),[0,0,0,0],readBufferFromBigInt(this.offsetId,8,little:true,signed:true),readBufferFromBigInt(this.limit,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetMaskStickers {
    static const CONSTRUCTOR_ID = 1706608543;
    static const SUBCLASS_OF_ID = 1166231593;
    final classType = "request";
    final ID = 1706608543;
	int hash;


	GetMaskStickers({this.hash});

	static GetMaskStickers fromReader(BinaryReader reader) {
	var temp,len;var hash = reader.readInt();		return new GetMaskStickers(hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1706608543,4),readBufferFromBigInt(this.hash,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetAttachedStickers {
    static const CONSTRUCTOR_ID = 3428542412;
    static const SUBCLASS_OF_ID = 3423756139;
    final classType = "request";
    final ID = 3428542412;
	var media;


	GetAttachedStickers({this.media});

	static GetAttachedStickers fromReader(BinaryReader reader) {
	var temp,len;var media = reader.tgReadObject();		return new GetAttachedStickers(media : media);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3428542412,4),(this.media.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SetGameScore {
    static const CONSTRUCTOR_ID = 2398678208;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 2398678208;
	bool editMessage;
	bool force;
	var peer;
	int id;
	var userId;
	int score;


	SetGameScore({this.editMessage, this.force, this.peer, this.id, this.userId, this.score});

	static SetGameScore fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final editMessage = false;final force = false;var peer = reader.tgReadObject();var id = reader.readInt();var userId = reader.tgReadObject();var score = reader.readInt();		return new SetGameScore(editMessage : editMessage, force : force, peer : peer, id : id, userId : userId, score : score);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2398678208,4),[0,0,0,0],(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.id,4,little:true,signed:true),(this.userId.getBytes() as List<int>),readBufferFromBigInt(this.score,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SetInlineGameScore {
    static const CONSTRUCTOR_ID = 363700068;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 363700068;
	bool editMessage;
	bool force;
	var id;
	var userId;
	int score;


	SetInlineGameScore({this.editMessage, this.force, this.id, this.userId, this.score});

	static SetInlineGameScore fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final editMessage = false;final force = false;var id = reader.tgReadObject();var userId = reader.tgReadObject();var score = reader.readInt();		return new SetInlineGameScore(editMessage : editMessage, force : force, id : id, userId : userId, score : score);
	}
	List<int> getBytes(){return [readBufferFromBigInt(363700068,4),[0,0,0,0],(this.id.getBytes() as List<int>),(this.userId.getBytes() as List<int>),readBufferFromBigInt(this.score,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetGameHighScores {
    static const CONSTRUCTOR_ID = 3894568093;
    static const SUBCLASS_OF_ID = 1825412605;
    final classType = "request";
    final ID = 3894568093;
	var peer;
	int id;
	var userId;


	GetGameHighScores({this.peer, this.id, this.userId});

	static GetGameHighScores fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var id = reader.readInt();var userId = reader.tgReadObject();		return new GetGameHighScores(peer : peer, id : id, userId : userId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3894568093,4),(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.id,4,little:true,signed:true),(this.userId.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetInlineGameHighScores {
    static const CONSTRUCTOR_ID = 258170395;
    static const SUBCLASS_OF_ID = 1825412605;
    final classType = "request";
    final ID = 258170395;
	var id;
	var userId;


	GetInlineGameHighScores({this.id, this.userId});

	static GetInlineGameHighScores fromReader(BinaryReader reader) {
	var temp,len;var id = reader.tgReadObject();var userId = reader.tgReadObject();		return new GetInlineGameHighScores(id : id, userId : userId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(258170395,4),(this.id.getBytes() as List<int>),(this.userId.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetCommonChats {
    static const CONSTRUCTOR_ID = 218777796;
    static const SUBCLASS_OF_ID = 2580925204;
    final classType = "request";
    final ID = 218777796;
	var userId;
	int maxId;
	int limit;


	GetCommonChats({this.userId, this.maxId, this.limit});

	static GetCommonChats fromReader(BinaryReader reader) {
	var temp,len;var userId = reader.tgReadObject();var maxId = reader.readInt();var limit = reader.readInt();		return new GetCommonChats(userId : userId, maxId : maxId, limit : limit);
	}
	List<int> getBytes(){return [readBufferFromBigInt(218777796,4),(this.userId.getBytes() as List<int>),readBufferFromBigInt(this.maxId,4,little:true,signed:true),readBufferFromBigInt(this.limit,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetAllChats {
    static const CONSTRUCTOR_ID = 3953659888;
    static const SUBCLASS_OF_ID = 2580925204;
    final classType = "request";
    final ID = 3953659888;
	List<int> exceptIds;


	GetAllChats({this.exceptIds});

	static GetAllChats fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<int> exceptIds = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		exceptIds.add(reader.readInt());
}		return new GetAllChats(exceptIds : exceptIds);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3953659888,4),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.exceptIds.length,4,little:true,signed:true),this.exceptIds.map((x)=>readBufferFromBigInt(x,4,little:true,signed:true)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetWebPage {
    static const CONSTRUCTOR_ID = 852135825;
    static const SUBCLASS_OF_ID = 1437168769;
    final classType = "request";
    final ID = 852135825;
	String url;
	int hash;


	GetWebPage({this.url, this.hash});

	static GetWebPage fromReader(BinaryReader reader) {
	var temp,len;var url = reader.tgReadString();var hash = reader.readInt();		return new GetWebPage(url : url, hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(852135825,4),serializeBytes(this.url),readBufferFromBigInt(this.hash,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ToggleDialogPin {
    static const CONSTRUCTOR_ID = 2805064279;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 2805064279;
	bool pinned;
	var peer;


	ToggleDialogPin({this.pinned, this.peer});

	static ToggleDialogPin fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final pinned = false;var peer = reader.tgReadObject();		return new ToggleDialogPin(pinned : pinned, peer : peer);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2805064279,4),[0,0,0,0],(this.peer.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ReorderPinnedDialogs {
    static const CONSTRUCTOR_ID = 991616823;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 991616823;
	bool force;
	int folderId;
	List<dynamic> order;


	ReorderPinnedDialogs({this.force, this.folderId, this.order});

	static ReorderPinnedDialogs fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final force = false;var folderId = reader.readInt();reader.readInt();
List<dynamic> order = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		order.add(reader.tgReadObject());
}		return new ReorderPinnedDialogs(force : force, folderId : folderId, order : order);
	}
	List<int> getBytes(){return [readBufferFromBigInt(991616823,4),[0,0,0,0],readBufferFromBigInt(this.folderId,4,little:true,signed:true),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.order.length,4,little:true,signed:true),this.order.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetPinnedDialogs {
    static const CONSTRUCTOR_ID = 3602468338;
    static const SUBCLASS_OF_ID = 986120498;
    final classType = "request";
    final ID = 3602468338;
	int folderId;


	GetPinnedDialogs({this.folderId});

	static GetPinnedDialogs fromReader(BinaryReader reader) {
	var temp,len;var folderId = reader.readInt();		return new GetPinnedDialogs(folderId : folderId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3602468338,4),readBufferFromBigInt(this.folderId,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SetBotShippingResults {
    static const CONSTRUCTOR_ID = 3858133754;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3858133754;
	BigInt queryId;
	String error;
	List<dynamic> shippingOptions;


	SetBotShippingResults({this.queryId, this.error, this.shippingOptions});

	static SetBotShippingResults fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();var queryId = reader.readLong();var error;if ((flags & 1)==1){var error = reader.tgReadString(); } else {error=null;}var shippingOptions;if ((flags & 2)==1){reader.readInt();
List<dynamic> shippingOptions = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		shippingOptions.add(reader.tgReadObject());
} } else {shippingOptions=null;}		return new SetBotShippingResults(queryId : queryId, error : error, shippingOptions : shippingOptions);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3858133754,4),[0,0,0,0],readBufferFromBigInt(this.queryId,8,little:true,signed:true),(this.error==null||this.error==false)?new List<int>():[serializeBytes(this.error)].expand((element) => element).toList(),(this.shippingOptions==null||this.shippingOptions==false)?new List<int>():[readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.shippingOptions.length,4,little:true,signed:true),this.shippingOptions.map((x)=>(x.getBytes() as List<int>)).expand((element) => element)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SetBotPrecheckoutResults {
    static const CONSTRUCTOR_ID = 163765653;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 163765653;
	bool success;
	BigInt queryId;
	String error;


	SetBotPrecheckoutResults({this.success, this.queryId, this.error});

	static SetBotPrecheckoutResults fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final success = false;var queryId = reader.readLong();var error;if ((flags & 1)==1){var error = reader.tgReadString(); } else {error=null;}		return new SetBotPrecheckoutResults(success : success, queryId : queryId, error : error);
	}
	List<int> getBytes(){return [readBufferFromBigInt(163765653,4),[0,0,0,0],readBufferFromBigInt(this.queryId,8,little:true,signed:true),(this.error==null||this.error==false)?new List<int>():[serializeBytes(this.error)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class UploadMedia {
    static const CONSTRUCTOR_ID = 1369162417;
    static const SUBCLASS_OF_ID = 1198308914;
    final classType = "request";
    final ID = 1369162417;
	var peer;
	var media;


	UploadMedia({this.peer, this.media});

	static UploadMedia fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var media = reader.tgReadObject();		return new UploadMedia(peer : peer, media : media);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1369162417,4),(this.peer.getBytes() as List<int>),(this.media.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SendScreenshotNotification {
    static const CONSTRUCTOR_ID = 3380473888;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 3380473888;
	var peer;
	int replyToMsgId;
	BigInt randomId;


	SendScreenshotNotification({this.peer, this.replyToMsgId, this.randomId});

	static SendScreenshotNotification fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var replyToMsgId = reader.readInt();var randomId = reader.readLong();		return new SendScreenshotNotification(peer : peer, replyToMsgId : replyToMsgId, randomId : randomId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3380473888,4),(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.replyToMsgId,4,little:true,signed:true),readBufferFromBigInt(this.randomId,8,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetFavedStickers {
    static const CONSTRUCTOR_ID = 567151374;
    static const SUBCLASS_OF_ID = 2389929913;
    final classType = "request";
    final ID = 567151374;
	int hash;


	GetFavedStickers({this.hash});

	static GetFavedStickers fromReader(BinaryReader reader) {
	var temp,len;var hash = reader.readInt();		return new GetFavedStickers(hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(567151374,4),readBufferFromBigInt(this.hash,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class FaveSticker {
    static const CONSTRUCTOR_ID = 3120547163;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3120547163;
	var id;
	bool unfave;


	FaveSticker({this.id, this.unfave});

	static FaveSticker fromReader(BinaryReader reader) {
	var temp,len;var id = reader.tgReadObject();var unfave = reader.tgReadBool();		return new FaveSticker(id : id, unfave : unfave);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3120547163,4),(this.id.getBytes() as List<int>),[this.unfave ? 0xb5757299 : 0x379779bc],].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetUnreadMentions {
    static const CONSTRUCTOR_ID = 1180140658;
    static const SUBCLASS_OF_ID = 3568569182;
    final classType = "request";
    final ID = 1180140658;
	var peer;
	int offsetId;
	int addOffset;
	int limit;
	int maxId;
	int minId;


	GetUnreadMentions({this.peer, this.offsetId, this.addOffset, this.limit, this.maxId, this.minId});

	static GetUnreadMentions fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var offsetId = reader.readInt();var addOffset = reader.readInt();var limit = reader.readInt();var maxId = reader.readInt();var minId = reader.readInt();		return new GetUnreadMentions(peer : peer, offsetId : offsetId, addOffset : addOffset, limit : limit, maxId : maxId, minId : minId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1180140658,4),(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.offsetId,4,little:true,signed:true),readBufferFromBigInt(this.addOffset,4,little:true,signed:true),readBufferFromBigInt(this.limit,4,little:true,signed:true),readBufferFromBigInt(this.maxId,4,little:true,signed:true),readBufferFromBigInt(this.minId,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ReadMentions {
    static const CONSTRUCTOR_ID = 251759059;
    static const SUBCLASS_OF_ID = 743031062;
    final classType = "request";
    final ID = 251759059;
	var peer;


	ReadMentions({this.peer});

	static ReadMentions fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();		return new ReadMentions(peer : peer);
	}
	List<int> getBytes(){return [readBufferFromBigInt(251759059,4),(this.peer.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetRecentLocations {
    static const CONSTRUCTOR_ID = 3150207753;
    static const SUBCLASS_OF_ID = 3568569182;
    final classType = "request";
    final ID = 3150207753;
	var peer;
	int limit;
	int hash;


	GetRecentLocations({this.peer, this.limit, this.hash});

	static GetRecentLocations fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var limit = reader.readInt();var hash = reader.readInt();		return new GetRecentLocations(peer : peer, limit : limit, hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3150207753,4),(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.limit,4,little:true,signed:true),readBufferFromBigInt(this.hash,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SendMultiMedia {
    static const CONSTRUCTOR_ID = 3422621899;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 3422621899;
	bool silent;
	bool background;
	bool clearDraft;
	var peer;
	int replyToMsgId;
	List<dynamic> multiMedia;
	int scheduleDate;


	SendMultiMedia({this.silent, this.background, this.clearDraft, this.peer, this.replyToMsgId, this.multiMedia, this.scheduleDate});

	static SendMultiMedia fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final silent = false;final background = false;final clearDraft = false;var peer = reader.tgReadObject();var replyToMsgId;if ((flags & 1)==1){var replyToMsgId = reader.readInt(); } else {replyToMsgId=null;}reader.readInt();
List<dynamic> multiMedia = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		multiMedia.add(reader.tgReadObject());
}var scheduleDate;if ((flags & 1024)==1){var scheduleDate = reader.readInt(); } else {scheduleDate=null;}		return new SendMultiMedia(silent : silent, background : background, clearDraft : clearDraft, peer : peer, replyToMsgId : replyToMsgId, multiMedia : multiMedia, scheduleDate : scheduleDate);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3422621899,4),[0,0,0,0],(this.peer.getBytes() as List<int>),(this.replyToMsgId==null||this.replyToMsgId==false)?new List<int>():[readBufferFromBigInt(this.replyToMsgId,4,little:true,signed:true)].expand((element) => element).toList(),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.multiMedia.length,4,little:true,signed:true),this.multiMedia.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),(this.scheduleDate==null||this.scheduleDate==false)?new List<int>():[readBufferFromBigInt(this.scheduleDate,4,little:true,signed:true)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class UploadEncryptedFile {
    static const CONSTRUCTOR_ID = 1347929239;
    static const SUBCLASS_OF_ID = 2217371584;
    final classType = "request";
    final ID = 1347929239;
	var peer;
	var file;


	UploadEncryptedFile({this.peer, this.file});

	static UploadEncryptedFile fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var file = reader.tgReadObject();		return new UploadEncryptedFile(peer : peer, file : file);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1347929239,4),(this.peer.getBytes() as List<int>),(this.file.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SearchStickerSets {
    static const CONSTRUCTOR_ID = 3266826379;
    static const SUBCLASS_OF_ID = 68023137;
    final classType = "request";
    final ID = 3266826379;
	bool excludeFeatured;
	String q;
	int hash;


	SearchStickerSets({this.excludeFeatured, this.q, this.hash});

	static SearchStickerSets fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final excludeFeatured = false;var q = reader.tgReadString();var hash = reader.readInt();		return new SearchStickerSets(excludeFeatured : excludeFeatured, q : q, hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3266826379,4),[0,0,0,0],serializeBytes(this.q),readBufferFromBigInt(this.hash,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetSplitRanges {
    static const CONSTRUCTOR_ID = 486505992;
    static const SUBCLASS_OF_ID = 1537549572;
    final classType = "request";
    final ID = 486505992;


	GetSplitRanges();

	static GetSplitRanges fromReader(BinaryReader reader) {
	var temp,len;		return new GetSplitRanges();
	}
	List<int> getBytes(){return [readBufferFromBigInt(486505992,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class MarkDialogUnread {
    static const CONSTRUCTOR_ID = 3263617423;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3263617423;
	bool unread;
	var peer;


	MarkDialogUnread({this.unread, this.peer});

	static MarkDialogUnread fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final unread = false;var peer = reader.tgReadObject();		return new MarkDialogUnread(unread : unread, peer : peer);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3263617423,4),[0,0,0,0],(this.peer.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetDialogUnreadMarks {
    static const CONSTRUCTOR_ID = 585256482;
    static const SUBCLASS_OF_ID = 3200666329;
    final classType = "request";
    final ID = 585256482;


	GetDialogUnreadMarks();

	static GetDialogUnreadMarks fromReader(BinaryReader reader) {
	var temp,len;		return new GetDialogUnreadMarks();
	}
	List<int> getBytes(){return [readBufferFromBigInt(585256482,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ClearAllDrafts {
    static const CONSTRUCTOR_ID = 2119757468;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 2119757468;


	ClearAllDrafts();

	static ClearAllDrafts fromReader(BinaryReader reader) {
	var temp,len;		return new ClearAllDrafts();
	}
	List<int> getBytes(){return [readBufferFromBigInt(2119757468,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class UpdatePinnedMessage {
    static const CONSTRUCTOR_ID = 3534419948;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 3534419948;
	bool silent;
	var peer;
	int id;


	UpdatePinnedMessage({this.silent, this.peer, this.id});

	static UpdatePinnedMessage fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final silent = false;var peer = reader.tgReadObject();var id = reader.readInt();		return new UpdatePinnedMessage(silent : silent, peer : peer, id : id);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3534419948,4),[0,0,0,0],(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.id,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SendVote {
    static const CONSTRUCTOR_ID = 283795844;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 283795844;
	var peer;
	int msgId;
	List<List<int>> options;


	SendVote({this.peer, this.msgId, this.options});

	static SendVote fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var msgId = reader.readInt();reader.readInt();
List<List<int>> options = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		options.add(reader.tgReadBytes());
}		return new SendVote(peer : peer, msgId : msgId, options : options);
	}
	List<int> getBytes(){return [readBufferFromBigInt(283795844,4),(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.msgId,4,little:true,signed:true),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.options.length,4,little:true,signed:true),this.options.map((x)=>serializeBytes(x)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetPollResults {
    static const CONSTRUCTOR_ID = 1941660731;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 1941660731;
	var peer;
	int msgId;


	GetPollResults({this.peer, this.msgId});

	static GetPollResults fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var msgId = reader.readInt();		return new GetPollResults(peer : peer, msgId : msgId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1941660731,4),(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.msgId,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetOnlines {
    static const CONSTRUCTOR_ID = 1848369232;
    static const SUBCLASS_OF_ID = 2357301306;
    final classType = "request";
    final ID = 1848369232;
	var peer;


	GetOnlines({this.peer});

	static GetOnlines fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();		return new GetOnlines(peer : peer);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1848369232,4),(this.peer.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetStatsURL {
    static const CONSTRUCTOR_ID = 2167155430;
    static const SUBCLASS_OF_ID = 2370606272;
    final classType = "request";
    final ID = 2167155430;
	bool dark;
	var peer;
	String params;


	GetStatsURL({this.dark, this.peer, this.params});

	static GetStatsURL fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final dark = false;var peer = reader.tgReadObject();var params = reader.tgReadString();		return new GetStatsURL(dark : dark, peer : peer, params : params);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2167155430,4),[0,0,0,0],(this.peer.getBytes() as List<int>),serializeBytes(this.params),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class EditChatAbout {
    static const CONSTRUCTOR_ID = 3740665751;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3740665751;
	var peer;
	String about;


	EditChatAbout({this.peer, this.about});

	static EditChatAbout fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var about = reader.tgReadString();		return new EditChatAbout(peer : peer, about : about);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3740665751,4),(this.peer.getBytes() as List<int>),serializeBytes(this.about),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class EditChatDefaultBannedRights {
    static const CONSTRUCTOR_ID = 2777049921;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 2777049921;
	var peer;
	var bannedRights;


	EditChatDefaultBannedRights({this.peer, this.bannedRights});

	static EditChatDefaultBannedRights fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var bannedRights = reader.tgReadObject();		return new EditChatDefaultBannedRights(peer : peer, bannedRights : bannedRights);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2777049921,4),(this.peer.getBytes() as List<int>),(this.bannedRights.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetEmojiKeywords {
    static const CONSTRUCTOR_ID = 899735650;
    static const SUBCLASS_OF_ID = 3531196018;
    final classType = "request";
    final ID = 899735650;
	String langCode;


	GetEmojiKeywords({this.langCode});

	static GetEmojiKeywords fromReader(BinaryReader reader) {
	var temp,len;var langCode = reader.tgReadString();		return new GetEmojiKeywords(langCode : langCode);
	}
	List<int> getBytes(){return [readBufferFromBigInt(899735650,4),serializeBytes(this.langCode),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetEmojiKeywordsDifference {
    static const CONSTRUCTOR_ID = 352892591;
    static const SUBCLASS_OF_ID = 3531196018;
    final classType = "request";
    final ID = 352892591;
	String langCode;
	int fromVersion;


	GetEmojiKeywordsDifference({this.langCode, this.fromVersion});

	static GetEmojiKeywordsDifference fromReader(BinaryReader reader) {
	var temp,len;var langCode = reader.tgReadString();var fromVersion = reader.readInt();		return new GetEmojiKeywordsDifference(langCode : langCode, fromVersion : fromVersion);
	}
	List<int> getBytes(){return [readBufferFromBigInt(352892591,4),serializeBytes(this.langCode),readBufferFromBigInt(this.fromVersion,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetEmojiKeywordsLanguages {
    static const CONSTRUCTOR_ID = 1318675378;
    static const SUBCLASS_OF_ID = 3885355911;
    final classType = "request";
    final ID = 1318675378;
	List<String> langCodes;


	GetEmojiKeywordsLanguages({this.langCodes});

	static GetEmojiKeywordsLanguages fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<String> langCodes = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		langCodes.add(reader.tgReadString());
}		return new GetEmojiKeywordsLanguages(langCodes : langCodes);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1318675378,4),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.langCodes.length,4,little:true,signed:true),this.langCodes.map((x)=>serializeBytes(x)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetEmojiURL {
    static const CONSTRUCTOR_ID = 3585149990;
    static const SUBCLASS_OF_ID = 530614809;
    final classType = "request";
    final ID = 3585149990;
	String langCode;


	GetEmojiURL({this.langCode});

	static GetEmojiURL fromReader(BinaryReader reader) {
	var temp,len;var langCode = reader.tgReadString();		return new GetEmojiURL(langCode : langCode);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3585149990,4),serializeBytes(this.langCode),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetSearchCounters {
    static const CONSTRUCTOR_ID = 1932455680;
    static const SUBCLASS_OF_ID = 1809726574;
    final classType = "request";
    final ID = 1932455680;
	var peer;
	List<dynamic> filters;


	GetSearchCounters({this.peer, this.filters});

	static GetSearchCounters fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();reader.readInt();
List<dynamic> filters = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		filters.add(reader.tgReadObject());
}		return new GetSearchCounters(peer : peer, filters : filters);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1932455680,4),(this.peer.getBytes() as List<int>),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.filters.length,4,little:true,signed:true),this.filters.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class RequestUrlAuth {
    static const CONSTRUCTOR_ID = 3812578835;
    static const SUBCLASS_OF_ID = 2003159838;
    final classType = "request";
    final ID = 3812578835;
	var peer;
	int msgId;
	int buttonId;


	RequestUrlAuth({this.peer, this.msgId, this.buttonId});

	static RequestUrlAuth fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var msgId = reader.readInt();var buttonId = reader.readInt();		return new RequestUrlAuth(peer : peer, msgId : msgId, buttonId : buttonId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3812578835,4),(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.msgId,4,little:true,signed:true),readBufferFromBigInt(this.buttonId,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class AcceptUrlAuth {
    static const CONSTRUCTOR_ID = 4146719384;
    static const SUBCLASS_OF_ID = 2003159838;
    final classType = "request";
    final ID = 4146719384;
	bool writeAllowed;
	var peer;
	int msgId;
	int buttonId;


	AcceptUrlAuth({this.writeAllowed, this.peer, this.msgId, this.buttonId});

	static AcceptUrlAuth fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final writeAllowed = false;var peer = reader.tgReadObject();var msgId = reader.readInt();var buttonId = reader.readInt();		return new AcceptUrlAuth(writeAllowed : writeAllowed, peer : peer, msgId : msgId, buttonId : buttonId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4146719384,4),[0,0,0,0],(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.msgId,4,little:true,signed:true),readBufferFromBigInt(this.buttonId,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class HidePeerSettingsBar {
    static const CONSTRUCTOR_ID = 1336717624;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 1336717624;
	var peer;


	HidePeerSettingsBar({this.peer});

	static HidePeerSettingsBar fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();		return new HidePeerSettingsBar(peer : peer);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1336717624,4),(this.peer.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetScheduledHistory {
    static const CONSTRUCTOR_ID = 3804391515;
    static const SUBCLASS_OF_ID = 3568569182;
    final classType = "request";
    final ID = 3804391515;
	var peer;
	int hash;


	GetScheduledHistory({this.peer, this.hash});

	static GetScheduledHistory fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var hash = reader.readInt();		return new GetScheduledHistory(peer : peer, hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3804391515,4),(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.hash,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetScheduledMessages {
    static const CONSTRUCTOR_ID = 3183150180;
    static const SUBCLASS_OF_ID = 3568569182;
    final classType = "request";
    final ID = 3183150180;
	var peer;
	List<int> id;


	GetScheduledMessages({this.peer, this.id});

	static GetScheduledMessages fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();reader.readInt();
List<int> id = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		id.add(reader.readInt());
}		return new GetScheduledMessages(peer : peer, id : id);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3183150180,4),(this.peer.getBytes() as List<int>),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.id.length,4,little:true,signed:true),this.id.map((x)=>readBufferFromBigInt(x,4,little:true,signed:true)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SendScheduledMessages {
    static const CONSTRUCTOR_ID = 3174597898;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 3174597898;
	var peer;
	List<int> id;


	SendScheduledMessages({this.peer, this.id});

	static SendScheduledMessages fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();reader.readInt();
List<int> id = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		id.add(reader.readInt());
}		return new SendScheduledMessages(peer : peer, id : id);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3174597898,4),(this.peer.getBytes() as List<int>),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.id.length,4,little:true,signed:true),this.id.map((x)=>readBufferFromBigInt(x,4,little:true,signed:true)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class DeleteScheduledMessages {
    static const CONSTRUCTOR_ID = 1504586518;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 1504586518;
	var peer;
	List<int> id;


	DeleteScheduledMessages({this.peer, this.id});

	static DeleteScheduledMessages fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();reader.readInt();
List<int> id = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		id.add(reader.readInt());
}		return new DeleteScheduledMessages(peer : peer, id : id);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1504586518,4),(this.peer.getBytes() as List<int>),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.id.length,4,little:true,signed:true),this.id.map((x)=>readBufferFromBigInt(x,4,little:true,signed:true)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetPollVotes {
    static const CONSTRUCTOR_ID = 3094231054;
    static const SUBCLASS_OF_ID = 3256457349;
    final classType = "request";
    final ID = 3094231054;
	var peer;
	int id;
	List<int> option;
	String offset;
	int limit;


	GetPollVotes({this.peer, this.id, this.option, this.offset, this.limit});

	static GetPollVotes fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();var peer = reader.tgReadObject();var id = reader.readInt();var option;if ((flags & 1)==1){var option = reader.tgReadBytes(); } else {option=null;}var offset;if ((flags & 2)==1){var offset = reader.tgReadString(); } else {offset=null;}var limit = reader.readInt();		return new GetPollVotes(peer : peer, id : id, option : option, offset : offset, limit : limit);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3094231054,4),[0,0,0,0],(this.peer.getBytes() as List<int>),readBufferFromBigInt(this.id,4,little:true,signed:true),(this.option==null||this.option==false)?new List<int>():[serializeBytes(this.option)].expand((element) => element).toList(),(this.offset==null||this.offset==false)?new List<int>():[serializeBytes(this.offset)].expand((element) => element).toList(),readBufferFromBigInt(this.limit,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ToggleStickerSets {
    static const CONSTRUCTOR_ID = 3037016042;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3037016042;
	bool uninstall;
	bool archive;
	bool unarchive;
	List<dynamic> stickersets;


	ToggleStickerSets({this.uninstall, this.archive, this.unarchive, this.stickersets});

	static ToggleStickerSets fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final uninstall = false;final archive = false;final unarchive = false;reader.readInt();
List<dynamic> stickersets = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		stickersets.add(reader.tgReadObject());
}		return new ToggleStickerSets(uninstall : uninstall, archive : archive, unarchive : unarchive, stickersets : stickersets);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3037016042,4),[0,0,0,0],readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.stickersets.length,4,little:true,signed:true),this.stickersets.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetDialogFilters {
    static const CONSTRUCTOR_ID = 4053719405;
    static const SUBCLASS_OF_ID = 1612507469;
    final classType = "request";
    final ID = 4053719405;


	GetDialogFilters();

	static GetDialogFilters fromReader(BinaryReader reader) {
	var temp,len;		return new GetDialogFilters();
	}
	List<int> getBytes(){return [readBufferFromBigInt(4053719405,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetSuggestedDialogFilters {
    static const CONSTRUCTOR_ID = 2728186924;
    static const SUBCLASS_OF_ID = 2066312249;
    final classType = "request";
    final ID = 2728186924;


	GetSuggestedDialogFilters();

	static GetSuggestedDialogFilters fromReader(BinaryReader reader) {
	var temp,len;		return new GetSuggestedDialogFilters();
	}
	List<int> getBytes(){return [readBufferFromBigInt(2728186924,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class UpdateDialogFilter {
    static const CONSTRUCTOR_ID = 450142282;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 450142282;
	int id;
	var filter;


	UpdateDialogFilter({this.id, this.filter});

	static UpdateDialogFilter fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();var id = reader.readInt();var filter;if ((flags & 1)==1){var filter = reader.tgReadObject(); } else {filter=null;}		return new UpdateDialogFilter(id : id, filter : filter);
	}
	List<int> getBytes(){return [readBufferFromBigInt(450142282,4),[0,0,0,0],readBufferFromBigInt(this.id,4,little:true,signed:true),(this.filter==null||this.filter==false)?new List<int>():[(this.filter.getBytes() as List<int>)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class UpdateDialogFiltersOrder {
    static const CONSTRUCTOR_ID = 3311649252;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3311649252;
	List<int> order;


	UpdateDialogFiltersOrder({this.order});

	static UpdateDialogFiltersOrder fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<int> order = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		order.add(reader.readInt());
}		return new UpdateDialogFiltersOrder(order : order);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3311649252,4),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.order.length,4,little:true,signed:true),this.order.map((x)=>readBufferFromBigInt(x,4,little:true,signed:true)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetOldFeaturedStickers {
    static const CONSTRUCTOR_ID = 1608974939;
    static const SUBCLASS_OF_ID = 638891810;
    final classType = "request";
    final ID = 1608974939;
	int offset;
	int limit;
	int hash;


	GetOldFeaturedStickers({this.offset, this.limit, this.hash});

	static GetOldFeaturedStickers fromReader(BinaryReader reader) {
	var temp,len;var offset = reader.readInt();var limit = reader.readInt();var hash = reader.readInt();		return new GetOldFeaturedStickers(offset : offset, limit : limit, hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1608974939,4),readBufferFromBigInt(this.offset,4,little:true,signed:true),readBufferFromBigInt(this.limit,4,little:true,signed:true),readBufferFromBigInt(this.hash,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}