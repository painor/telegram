import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class Dialogs {
    static const CONSTRUCTOR_ID = 364538944;
    static const SUBCLASS_OF_ID = 236671726;
	List<dynamic> dialogs;
	List<dynamic> messages;
	List<dynamic> chats;
	List<dynamic> users;


	Dialogs({this.dialogs, this.messages, this.chats, this.users});

	static Dialogs fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<dynamic> dialogs = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		dialogs.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> messages = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		messages.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> chats = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		chats.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> users = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		users.add(reader.tgReadObject());
}		return new Dialogs(dialogs : dialogs, messages : messages, chats : chats, users : users);
	}
	List<int> getBytes(){return [readBufferFromBigInt(364538944,4),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.dialogs.length,4,little:true,signed:true),this.dialogs.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.messages.length,4,little:true,signed:true),this.messages.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.chats.length,4,little:true,signed:true),this.chats.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.users.length,4,little:true,signed:true),this.users.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}

class DialogsSlice {
    static const CONSTRUCTOR_ID = 1910543603;
    static const SUBCLASS_OF_ID = 236671726;
	int count;
	List<dynamic> dialogs;
	List<dynamic> messages;
	List<dynamic> chats;
	List<dynamic> users;


	DialogsSlice({this.count, this.dialogs, this.messages, this.chats, this.users});

	static DialogsSlice fromReader(BinaryReader reader) {
	var temp,len;var count = reader.readInt();reader.readInt();
List<dynamic> dialogs = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		dialogs.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> messages = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		messages.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> chats = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		chats.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> users = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		users.add(reader.tgReadObject());
}		return new DialogsSlice(count : count, dialogs : dialogs, messages : messages, chats : chats, users : users);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1910543603,4),readBufferFromBigInt(this.count,4,little:true,signed:true),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.dialogs.length,4,little:true,signed:true),this.dialogs.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.messages.length,4,little:true,signed:true),this.messages.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.chats.length,4,little:true,signed:true),this.chats.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.users.length,4,little:true,signed:true),this.users.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}

class DialogsNotModified {
    static const CONSTRUCTOR_ID = 4041467286;
    static const SUBCLASS_OF_ID = 236671726;
	int count;


	DialogsNotModified({this.count});

	static DialogsNotModified fromReader(BinaryReader reader) {
	var temp,len;var count = reader.readInt();		return new DialogsNotModified(count : count);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4041467286,4),readBufferFromBigInt(this.count,4,little:true,signed:true),].expand((element) => element).toList();}

}

class Messages {
    static const CONSTRUCTOR_ID = 2356252295;
    static const SUBCLASS_OF_ID = 3568569182;
	List<dynamic> messages;
	List<dynamic> chats;
	List<dynamic> users;


	Messages({this.messages, this.chats, this.users});

	static Messages fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<dynamic> messages = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		messages.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> chats = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		chats.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> users = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		users.add(reader.tgReadObject());
}		return new Messages(messages : messages, chats : chats, users : users);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2356252295,4),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.messages.length,4,little:true,signed:true),this.messages.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.chats.length,4,little:true,signed:true),this.chats.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.users.length,4,little:true,signed:true),this.users.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}

class MessagesSlice {
    static const CONSTRUCTOR_ID = 3371027998;
    static const SUBCLASS_OF_ID = 3568569182;
	bool inexact;
	int count;
	int nextRate;
	List<dynamic> messages;
	List<dynamic> chats;
	List<dynamic> users;


	MessagesSlice({this.inexact, this.count, this.nextRate, this.messages, this.chats, this.users});

	static MessagesSlice fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final inexact = false;var count = reader.readInt();var nextRate;if ((flags & 1)==1){var nextRate = reader.readInt(); } else {nextRate=null;}reader.readInt();
List<dynamic> messages = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		messages.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> chats = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		chats.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> users = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		users.add(reader.tgReadObject());
}		return new MessagesSlice(inexact : inexact, count : count, nextRate : nextRate, messages : messages, chats : chats, users : users);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3371027998,4),[0,0,0,0],readBufferFromBigInt(this.count,4,little:true,signed:true),(this.nextRate==null||this.nextRate==false)?[]:[readBufferFromBigInt(this.nextRate,4,little:true,signed:true)],readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.messages.length,4,little:true,signed:true),this.messages.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.chats.length,4,little:true,signed:true),this.chats.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.users.length,4,little:true,signed:true),this.users.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}

class ChannelMessages {
    static const CONSTRUCTOR_ID = 2569416247;
    static const SUBCLASS_OF_ID = 3568569182;
	bool inexact;
	int pts;
	int count;
	List<dynamic> messages;
	List<dynamic> chats;
	List<dynamic> users;


	ChannelMessages({this.inexact, this.pts, this.count, this.messages, this.chats, this.users});

	static ChannelMessages fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final inexact = false;var pts = reader.readInt();var count = reader.readInt();reader.readInt();
List<dynamic> messages = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		messages.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> chats = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		chats.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> users = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		users.add(reader.tgReadObject());
}		return new ChannelMessages(inexact : inexact, pts : pts, count : count, messages : messages, chats : chats, users : users);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2569416247,4),[0,0,0,0],readBufferFromBigInt(this.pts,4,little:true,signed:true),readBufferFromBigInt(this.count,4,little:true,signed:true),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.messages.length,4,little:true,signed:true),this.messages.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.chats.length,4,little:true,signed:true),this.chats.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.users.length,4,little:true,signed:true),this.users.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}

class MessagesNotModified {
    static const CONSTRUCTOR_ID = 1951620897;
    static const SUBCLASS_OF_ID = 3568569182;
	int count;


	MessagesNotModified({this.count});

	static MessagesNotModified fromReader(BinaryReader reader) {
	var temp,len;var count = reader.readInt();		return new MessagesNotModified(count : count);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1951620897,4),readBufferFromBigInt(this.count,4,little:true,signed:true),].expand((element) => element).toList();}

}

class Chats {
    static const CONSTRUCTOR_ID = 1694474197;
    static const SUBCLASS_OF_ID = 2580925204;
	List<dynamic> chats;


	Chats({this.chats});

	static Chats fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<dynamic> chats = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		chats.add(reader.tgReadObject());
}		return new Chats(chats : chats);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1694474197,4),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.chats.length,4,little:true,signed:true),this.chats.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}

class ChatsSlice {
    static const CONSTRUCTOR_ID = 2631405892;
    static const SUBCLASS_OF_ID = 2580925204;
	int count;
	List<dynamic> chats;


	ChatsSlice({this.count, this.chats});

	static ChatsSlice fromReader(BinaryReader reader) {
	var temp,len;var count = reader.readInt();reader.readInt();
List<dynamic> chats = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		chats.add(reader.tgReadObject());
}		return new ChatsSlice(count : count, chats : chats);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2631405892,4),readBufferFromBigInt(this.count,4,little:true,signed:true),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.chats.length,4,little:true,signed:true),this.chats.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}

class ChatFull {
    static const CONSTRUCTOR_ID = 3856126364;
    static const SUBCLASS_OF_ID = 576344329;
	var fullChat;
	List<dynamic> chats;
	List<dynamic> users;


	ChatFull({this.fullChat, this.chats, this.users});

	static ChatFull fromReader(BinaryReader reader) {
	var temp,len;var fullChat = reader.tgReadObject();reader.readInt();
List<dynamic> chats = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		chats.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> users = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		users.add(reader.tgReadObject());
}		return new ChatFull(fullChat : fullChat, chats : chats, users : users);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3856126364,4),this.fullChat.getBytes(),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.chats.length,4,little:true,signed:true),this.chats.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.users.length,4,little:true,signed:true),this.users.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}

class AffectedHistory {
    static const CONSTRUCTOR_ID = 3025955281;
    static const SUBCLASS_OF_ID = 743031062;
	int pts;
	int ptsCount;
	int offset;


	AffectedHistory({this.pts, this.ptsCount, this.offset});

	static AffectedHistory fromReader(BinaryReader reader) {
	var temp,len;var pts = reader.readInt();var ptsCount = reader.readInt();var offset = reader.readInt();		return new AffectedHistory(pts : pts, ptsCount : ptsCount, offset : offset);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3025955281,4),readBufferFromBigInt(this.pts,4,little:true,signed:true),readBufferFromBigInt(this.ptsCount,4,little:true,signed:true),readBufferFromBigInt(this.offset,4,little:true,signed:true),].expand((element) => element).toList();}

}

class DhConfigNotModified {
    static const CONSTRUCTOR_ID = 3236054581;
    static const SUBCLASS_OF_ID = 3834178955;
	List<int> random;


	DhConfigNotModified({this.random});

	static DhConfigNotModified fromReader(BinaryReader reader) {
	var temp,len;var random = reader.tgReadBytes();		return new DhConfigNotModified(random : random);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3236054581,4),serializeBytes(this.random),].expand((element) => element).toList();}

}

class DhConfig {
    static const CONSTRUCTOR_ID = 740433629;
    static const SUBCLASS_OF_ID = 3834178955;
	int g;
	List<int> p;
	int version;
	List<int> random;


	DhConfig({this.g, this.p, this.version, this.random});

	static DhConfig fromReader(BinaryReader reader) {
	var temp,len;var g = reader.readInt();var p = reader.tgReadBytes();var version = reader.readInt();var random = reader.tgReadBytes();		return new DhConfig(g : g, p : p, version : version, random : random);
	}
	List<int> getBytes(){return [readBufferFromBigInt(740433629,4),readBufferFromBigInt(this.g,4,little:true,signed:true),serializeBytes(this.p),readBufferFromBigInt(this.version,4,little:true,signed:true),serializeBytes(this.random),].expand((element) => element).toList();}

}

class SentEncryptedMessage {
    static const CONSTRUCTOR_ID = 1443858741;
    static const SUBCLASS_OF_ID = 3382591056;
	int date;


	SentEncryptedMessage({this.date});

	static SentEncryptedMessage fromReader(BinaryReader reader) {
	var temp,len;var date = reader.readInt();		return new SentEncryptedMessage(date : date);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1443858741,4),readBufferFromBigInt(this.date,4,little:true,signed:true),].expand((element) => element).toList();}

}

class SentEncryptedFile {
    static const CONSTRUCTOR_ID = 2492727090;
    static const SUBCLASS_OF_ID = 3382591056;
	int date;
	var file;


	SentEncryptedFile({this.date, this.file});

	static SentEncryptedFile fromReader(BinaryReader reader) {
	var temp,len;var date = reader.readInt();var file = reader.tgReadObject();		return new SentEncryptedFile(date : date, file : file);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2492727090,4),readBufferFromBigInt(this.date,4,little:true,signed:true),this.file.getBytes(),].expand((element) => element).toList();}

}

class StickersNotModified {
    static const CONSTRUCTOR_ID = 4050950690;
    static const SUBCLASS_OF_ID = 3611015646;


	StickersNotModified();

	static StickersNotModified fromReader(BinaryReader reader) {
	var temp,len;		return new StickersNotModified();
	}
	List<int> getBytes(){return [readBufferFromBigInt(4050950690,4),].expand((element) => element).toList();}

}

class Stickers {
    static const CONSTRUCTOR_ID = 3831077821;
    static const SUBCLASS_OF_ID = 3611015646;
	int hash;
	List<dynamic> stickers;


	Stickers({this.hash, this.stickers});

	static Stickers fromReader(BinaryReader reader) {
	var temp,len;var hash = reader.readInt();reader.readInt();
List<dynamic> stickers = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		stickers.add(reader.tgReadObject());
}		return new Stickers(hash : hash, stickers : stickers);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3831077821,4),readBufferFromBigInt(this.hash,4,little:true,signed:true),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.stickers.length,4,little:true,signed:true),this.stickers.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}

class AllStickersNotModified {
    static const CONSTRUCTOR_ID = 3898999491;
    static const SUBCLASS_OF_ID = 1166231593;


	AllStickersNotModified();

	static AllStickersNotModified fromReader(BinaryReader reader) {
	var temp,len;		return new AllStickersNotModified();
	}
	List<int> getBytes(){return [readBufferFromBigInt(3898999491,4),].expand((element) => element).toList();}

}

class AllStickers {
    static const CONSTRUCTOR_ID = 3992797279;
    static const SUBCLASS_OF_ID = 1166231593;
	int hash;
	List<dynamic> sets;


	AllStickers({this.hash, this.sets});

	static AllStickers fromReader(BinaryReader reader) {
	var temp,len;var hash = reader.readInt();reader.readInt();
List<dynamic> sets = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		sets.add(reader.tgReadObject());
}		return new AllStickers(hash : hash, sets : sets);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3992797279,4),readBufferFromBigInt(this.hash,4,little:true,signed:true),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.sets.length,4,little:true,signed:true),this.sets.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}

class AffectedMessages {
    static const CONSTRUCTOR_ID = 2228326789;
    static const SUBCLASS_OF_ID = 3469983854;
	int pts;
	int ptsCount;


	AffectedMessages({this.pts, this.ptsCount});

	static AffectedMessages fromReader(BinaryReader reader) {
	var temp,len;var pts = reader.readInt();var ptsCount = reader.readInt();		return new AffectedMessages(pts : pts, ptsCount : ptsCount);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2228326789,4),readBufferFromBigInt(this.pts,4,little:true,signed:true),readBufferFromBigInt(this.ptsCount,4,little:true,signed:true),].expand((element) => element).toList();}

}

class StickerSet {
    static const CONSTRUCTOR_ID = 3054118054;
    static const SUBCLASS_OF_ID = 2607827546;
	var set;
	List<dynamic> packs;
	List<dynamic> documents;


	StickerSet({this.set, this.packs, this.documents});

	static StickerSet fromReader(BinaryReader reader) {
	var temp,len;var set = reader.tgReadObject();reader.readInt();
List<dynamic> packs = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		packs.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> documents = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		documents.add(reader.tgReadObject());
}		return new StickerSet(set : set, packs : packs, documents : documents);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3054118054,4),this.set.getBytes(),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.packs.length,4,little:true,signed:true),this.packs.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.documents.length,4,little:true,signed:true),this.documents.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}

class FoundGifs {
    static const CONSTRUCTOR_ID = 1158290442;
    static const SUBCLASS_OF_ID = 242851495;
	int nextOffset;
	List<dynamic> results;


	FoundGifs({this.nextOffset, this.results});

	static FoundGifs fromReader(BinaryReader reader) {
	var temp,len;var nextOffset = reader.readInt();reader.readInt();
List<dynamic> results = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		results.add(reader.tgReadObject());
}		return new FoundGifs(nextOffset : nextOffset, results : results);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1158290442,4),readBufferFromBigInt(this.nextOffset,4,little:true,signed:true),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.results.length,4,little:true,signed:true),this.results.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}

class SavedGifsNotModified {
    static const CONSTRUCTOR_ID = 3892468898;
    static const SUBCLASS_OF_ID = 2794152437;


	SavedGifsNotModified();

	static SavedGifsNotModified fromReader(BinaryReader reader) {
	var temp,len;		return new SavedGifsNotModified();
	}
	List<int> getBytes(){return [readBufferFromBigInt(3892468898,4),].expand((element) => element).toList();}

}

class SavedGifs {
    static const CONSTRUCTOR_ID = 772213157;
    static const SUBCLASS_OF_ID = 2794152437;
	int hash;
	List<dynamic> gifs;


	SavedGifs({this.hash, this.gifs});

	static SavedGifs fromReader(BinaryReader reader) {
	var temp,len;var hash = reader.readInt();reader.readInt();
List<dynamic> gifs = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		gifs.add(reader.tgReadObject());
}		return new SavedGifs(hash : hash, gifs : gifs);
	}
	List<int> getBytes(){return [readBufferFromBigInt(772213157,4),readBufferFromBigInt(this.hash,4,little:true,signed:true),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.gifs.length,4,little:true,signed:true),this.gifs.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}

class BotResults {
    static const CONSTRUCTOR_ID = 2491197512;
    static const SUBCLASS_OF_ID = 1054136777;
	bool gallery;
	BigInt queryId;
	String nextOffset;
	var switchPm;
	List<dynamic> results;
	int cacheTime;
	List<dynamic> users;


	BotResults({this.gallery, this.queryId, this.nextOffset, this.switchPm, this.results, this.cacheTime, this.users});

	static BotResults fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final gallery = false;var queryId = reader.readLong();var nextOffset;if ((flags & 2)==1){var nextOffset = reader.tgReadString(); } else {nextOffset=null;}var switchPm;if ((flags & 4)==1){var switchPm = reader.tgReadObject(); } else {switchPm=null;}reader.readInt();
List<dynamic> results = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		results.add(reader.tgReadObject());
}var cacheTime = reader.readInt();reader.readInt();
List<dynamic> users = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		users.add(reader.tgReadObject());
}		return new BotResults(gallery : gallery, queryId : queryId, nextOffset : nextOffset, switchPm : switchPm, results : results, cacheTime : cacheTime, users : users);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2491197512,4),[0,0,0,0],readBufferFromBigInt(this.queryId,8,little:true,signed:true),(this.nextOffset==null||this.nextOffset==false)?[]:[serializeBytes(this.nextOffset)],(this.switchPm==null||this.switchPm==false)?[]:[this.switchPm.getBytes()],readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.results.length,4,little:true,signed:true),this.results.map((x)=>x.getBytes()),readBufferFromBigInt(this.cacheTime,4,little:true,signed:true),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.users.length,4,little:true,signed:true),this.users.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}

class BotCallbackAnswer {
    static const CONSTRUCTOR_ID = 911761060;
    static const SUBCLASS_OF_ID = 1817039244;
	bool alert;
	bool hasUrl;
	bool nativeUi;
	String message;
	String url;
	int cacheTime;


	BotCallbackAnswer({this.alert, this.hasUrl, this.nativeUi, this.message, this.url, this.cacheTime});

	static BotCallbackAnswer fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final alert = false;final hasUrl = false;final nativeUi = false;var message;if ((flags & 1)==1){var message = reader.tgReadString(); } else {message=null;}var url;if ((flags & 4)==1){var url = reader.tgReadString(); } else {url=null;}var cacheTime = reader.readInt();		return new BotCallbackAnswer(alert : alert, hasUrl : hasUrl, nativeUi : nativeUi, message : message, url : url, cacheTime : cacheTime);
	}
	List<int> getBytes(){return [readBufferFromBigInt(911761060,4),[0,0,0,0],(this.message==null||this.message==false)?[]:[serializeBytes(this.message)],(this.url==null||this.url==false)?[]:[serializeBytes(this.url)],readBufferFromBigInt(this.cacheTime,4,little:true,signed:true),].expand((element) => element).toList();}

}

class MessageEditData {
    static const CONSTRUCTOR_ID = 649453030;
    static const SUBCLASS_OF_ID = 4215772317;
	bool caption;


	MessageEditData({this.caption});

	static MessageEditData fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final caption = false;		return new MessageEditData(caption : caption);
	}
	List<int> getBytes(){return [readBufferFromBigInt(649453030,4),[0,0,0,0],].expand((element) => element).toList();}

}

class PeerDialogs {
    static const CONSTRUCTOR_ID = 863093588;
    static const SUBCLASS_OF_ID = 986120498;
	List<dynamic> dialogs;
	List<dynamic> messages;
	List<dynamic> chats;
	List<dynamic> users;
	var state;


	PeerDialogs({this.dialogs, this.messages, this.chats, this.users, this.state});

	static PeerDialogs fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<dynamic> dialogs = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		dialogs.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> messages = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		messages.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> chats = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		chats.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> users = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		users.add(reader.tgReadObject());
}var state = reader.tgReadObject();		return new PeerDialogs(dialogs : dialogs, messages : messages, chats : chats, users : users, state : state);
	}
	List<int> getBytes(){return [readBufferFromBigInt(863093588,4),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.dialogs.length,4,little:true,signed:true),this.dialogs.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.messages.length,4,little:true,signed:true),this.messages.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.chats.length,4,little:true,signed:true),this.chats.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.users.length,4,little:true,signed:true),this.users.map((x)=>x.getBytes()),this.state.getBytes(),].expand((element) => element).toList();}

}

class FeaturedStickersNotModified {
    static const CONSTRUCTOR_ID = 3336309862;
    static const SUBCLASS_OF_ID = 638891810;
	int count;


	FeaturedStickersNotModified({this.count});

	static FeaturedStickersNotModified fromReader(BinaryReader reader) {
	var temp,len;var count = reader.readInt();		return new FeaturedStickersNotModified(count : count);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3336309862,4),readBufferFromBigInt(this.count,4,little:true,signed:true),].expand((element) => element).toList();}

}

class FeaturedStickers {
    static const CONSTRUCTOR_ID = 3064709953;
    static const SUBCLASS_OF_ID = 638891810;
	int hash;
	int count;
	List<dynamic> sets;
	List<BigInt> unread;


	FeaturedStickers({this.hash, this.count, this.sets, this.unread});

	static FeaturedStickers fromReader(BinaryReader reader) {
	var temp,len;var hash = reader.readInt();var count = reader.readInt();reader.readInt();
List<dynamic> sets = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		sets.add(reader.tgReadObject());
}reader.readInt();
List<BigInt> unread = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		unread.add(reader.readLong());
}		return new FeaturedStickers(hash : hash, count : count, sets : sets, unread : unread);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3064709953,4),readBufferFromBigInt(this.hash,4,little:true,signed:true),readBufferFromBigInt(this.count,4,little:true,signed:true),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.sets.length,4,little:true,signed:true),this.sets.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.unread.length,4,little:true,signed:true),this.unread.map((x)=>readBufferFromBigInt(x,8,little:true,signed:true)),].expand((element) => element).toList();}

}

class RecentStickersNotModified {
    static const CONSTRUCTOR_ID = 186120336;
    static const SUBCLASS_OF_ID = 4151281283;


	RecentStickersNotModified();

	static RecentStickersNotModified fromReader(BinaryReader reader) {
	var temp,len;		return new RecentStickersNotModified();
	}
	List<int> getBytes(){return [readBufferFromBigInt(186120336,4),].expand((element) => element).toList();}

}

class RecentStickers {
    static const CONSTRUCTOR_ID = 586395571;
    static const SUBCLASS_OF_ID = 4151281283;
	int hash;
	List<dynamic> packs;
	List<dynamic> stickers;
	List<int> dates;


	RecentStickers({this.hash, this.packs, this.stickers, this.dates});

	static RecentStickers fromReader(BinaryReader reader) {
	var temp,len;var hash = reader.readInt();reader.readInt();
List<dynamic> packs = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		packs.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> stickers = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		stickers.add(reader.tgReadObject());
}reader.readInt();
List<int> dates = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		dates.add(reader.readInt());
}		return new RecentStickers(hash : hash, packs : packs, stickers : stickers, dates : dates);
	}
	List<int> getBytes(){return [readBufferFromBigInt(586395571,4),readBufferFromBigInt(this.hash,4,little:true,signed:true),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.packs.length,4,little:true,signed:true),this.packs.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.stickers.length,4,little:true,signed:true),this.stickers.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.dates.length,4,little:true,signed:true),this.dates.map((x)=>readBufferFromBigInt(x,4,little:true,signed:true)),].expand((element) => element).toList();}

}

class ArchivedStickers {
    static const CONSTRUCTOR_ID = 1338747336;
    static const SUBCLASS_OF_ID = 1922488177;
	int count;
	List<dynamic> sets;


	ArchivedStickers({this.count, this.sets});

	static ArchivedStickers fromReader(BinaryReader reader) {
	var temp,len;var count = reader.readInt();reader.readInt();
List<dynamic> sets = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		sets.add(reader.tgReadObject());
}		return new ArchivedStickers(count : count, sets : sets);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1338747336,4),readBufferFromBigInt(this.count,4,little:true,signed:true),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.sets.length,4,little:true,signed:true),this.sets.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}

class StickerSetInstallResultSuccess {
    static const CONSTRUCTOR_ID = 946083368;
    static const SUBCLASS_OF_ID = 1741373416;


	StickerSetInstallResultSuccess();

	static StickerSetInstallResultSuccess fromReader(BinaryReader reader) {
	var temp,len;		return new StickerSetInstallResultSuccess();
	}
	List<int> getBytes(){return [readBufferFromBigInt(946083368,4),].expand((element) => element).toList();}

}

class StickerSetInstallResultArchive {
    static const CONSTRUCTOR_ID = 904138920;
    static const SUBCLASS_OF_ID = 1741373416;
	List<dynamic> sets;


	StickerSetInstallResultArchive({this.sets});

	static StickerSetInstallResultArchive fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<dynamic> sets = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		sets.add(reader.tgReadObject());
}		return new StickerSetInstallResultArchive(sets : sets);
	}
	List<int> getBytes(){return [readBufferFromBigInt(904138920,4),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.sets.length,4,little:true,signed:true),this.sets.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}

class HighScores {
    static const CONSTRUCTOR_ID = 2587622809;
    static const SUBCLASS_OF_ID = 1825412605;
	List<dynamic> scores;
	List<dynamic> users;


	HighScores({this.scores, this.users});

	static HighScores fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<dynamic> scores = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		scores.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> users = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		users.add(reader.tgReadObject());
}		return new HighScores(scores : scores, users : users);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2587622809,4),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.scores.length,4,little:true,signed:true),this.scores.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.users.length,4,little:true,signed:true),this.users.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}

class FavedStickersNotModified {
    static const CONSTRUCTOR_ID = 2660214483;
    static const SUBCLASS_OF_ID = 2389929913;


	FavedStickersNotModified();

	static FavedStickersNotModified fromReader(BinaryReader reader) {
	var temp,len;		return new FavedStickersNotModified();
	}
	List<int> getBytes(){return [readBufferFromBigInt(2660214483,4),].expand((element) => element).toList();}

}

class FavedStickers {
    static const CONSTRUCTOR_ID = 4085198614;
    static const SUBCLASS_OF_ID = 2389929913;
	int hash;
	List<dynamic> packs;
	List<dynamic> stickers;


	FavedStickers({this.hash, this.packs, this.stickers});

	static FavedStickers fromReader(BinaryReader reader) {
	var temp,len;var hash = reader.readInt();reader.readInt();
List<dynamic> packs = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		packs.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> stickers = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		stickers.add(reader.tgReadObject());
}		return new FavedStickers(hash : hash, packs : packs, stickers : stickers);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4085198614,4),readBufferFromBigInt(this.hash,4,little:true,signed:true),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.packs.length,4,little:true,signed:true),this.packs.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.stickers.length,4,little:true,signed:true),this.stickers.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}

class FoundStickerSetsNotModified {
    static const CONSTRUCTOR_ID = 223655517;
    static const SUBCLASS_OF_ID = 68023137;


	FoundStickerSetsNotModified();

	static FoundStickerSetsNotModified fromReader(BinaryReader reader) {
	var temp,len;		return new FoundStickerSetsNotModified();
	}
	List<int> getBytes(){return [readBufferFromBigInt(223655517,4),].expand((element) => element).toList();}

}

class FoundStickerSets {
    static const CONSTRUCTOR_ID = 1359533640;
    static const SUBCLASS_OF_ID = 68023137;
	int hash;
	List<dynamic> sets;


	FoundStickerSets({this.hash, this.sets});

	static FoundStickerSets fromReader(BinaryReader reader) {
	var temp,len;var hash = reader.readInt();reader.readInt();
List<dynamic> sets = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		sets.add(reader.tgReadObject());
}		return new FoundStickerSets(hash : hash, sets : sets);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1359533640,4),readBufferFromBigInt(this.hash,4,little:true,signed:true),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.sets.length,4,little:true,signed:true),this.sets.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}

class SearchCounter {
    static const CONSTRUCTOR_ID = 3896830975;
    static const SUBCLASS_OF_ID = 3601317794;
	bool inexact;
	var filter;
	int count;


	SearchCounter({this.inexact, this.filter, this.count});

	static SearchCounter fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final inexact = false;var filter = reader.tgReadObject();var count = reader.readInt();		return new SearchCounter(inexact : inexact, filter : filter, count : count);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3896830975,4),[0,0,0,0],this.filter.getBytes(),readBufferFromBigInt(this.count,4,little:true,signed:true),].expand((element) => element).toList();}

}

class InactiveChats {
    static const CONSTRUCTOR_ID = 2837970629;
    static const SUBCLASS_OF_ID = 2348013524;
	List<int> dates;
	List<dynamic> chats;
	List<dynamic> users;


	InactiveChats({this.dates, this.chats, this.users});

	static InactiveChats fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<int> dates = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		dates.add(reader.readInt());
}reader.readInt();
List<dynamic> chats = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		chats.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> users = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		users.add(reader.tgReadObject());
}		return new InactiveChats(dates : dates, chats : chats, users : users);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2837970629,4),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.dates.length,4,little:true,signed:true),this.dates.map((x)=>readBufferFromBigInt(x,4,little:true,signed:true)),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.chats.length,4,little:true,signed:true),this.chats.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.users.length,4,little:true,signed:true),this.users.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}

class VotesList {
    static const CONSTRUCTOR_ID = 136574537;
    static const SUBCLASS_OF_ID = 3256457349;
	int count;
	List<dynamic> votes;
	List<dynamic> users;
	String nextOffset;


	VotesList({this.count, this.votes, this.users, this.nextOffset});

	static VotesList fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();var count = reader.readInt();reader.readInt();
List<dynamic> votes = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		votes.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> users = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		users.add(reader.tgReadObject());
}var nextOffset;if ((flags & 1)==1){var nextOffset = reader.tgReadString(); } else {nextOffset=null;}		return new VotesList(count : count, votes : votes, users : users, nextOffset : nextOffset);
	}
	List<int> getBytes(){return [readBufferFromBigInt(136574537,4),[0,0,0,0],readBufferFromBigInt(this.count,4,little:true,signed:true),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.votes.length,4,little:true,signed:true),this.votes.map((x)=>x.getBytes()),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.users.length,4,little:true,signed:true),this.users.map((x)=>x.getBytes()),(this.nextOffset==null||this.nextOffset==false)?[]:[serializeBytes(this.nextOffset)],].expand((element) => element).toList();}

}