// @dart=2.10
import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class ReadHistory {
    static const CONSTRUCTOR_ID = 3423619383;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3423619383;
	var channel;
	int maxId;


	ReadHistory({this.channel, this.maxId});

	static ReadHistory fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();var maxId = reader.readInt();		return new ReadHistory(channel : channel, maxId : maxId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3423619383,4),(this.channel.getBytes() as List<int>),readBufferFromBigInt(this.maxId,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class DeleteMessages {
    static const CONSTRUCTOR_ID = 2227305806;
    static const SUBCLASS_OF_ID = 3469983854;
    final classType = "request";
    final ID = 2227305806;
	var channel;
	List<int> id;


	DeleteMessages({this.channel, this.id});

	static DeleteMessages fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();reader.readInt();
List<int> id = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		id.add(reader.readInt());
}		return new DeleteMessages(channel : channel, id : id);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2227305806,4),(this.channel.getBytes() as List<int>),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.id.length,4,little:true,signed:true),this.id.map((x)=>readBufferFromBigInt(x,4,little:true,signed:true)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class DeleteUserHistory {
    static const CONSTRUCTOR_ID = 3507345179;
    static const SUBCLASS_OF_ID = 743031062;
    final classType = "request";
    final ID = 3507345179;
	var channel;
	var userId;


	DeleteUserHistory({this.channel, this.userId});

	static DeleteUserHistory fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();var userId = reader.tgReadObject();		return new DeleteUserHistory(channel : channel, userId : userId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3507345179,4),(this.channel.getBytes() as List<int>),(this.userId.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ReportSpam {
    static const CONSTRUCTOR_ID = 4261967888;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 4261967888;
	var channel;
	var userId;
	List<int> id;


	ReportSpam({this.channel, this.userId, this.id});

	static ReportSpam fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();var userId = reader.tgReadObject();reader.readInt();
List<int> id = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		id.add(reader.readInt());
}		return new ReportSpam(channel : channel, userId : userId, id : id);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4261967888,4),(this.channel.getBytes() as List<int>),(this.userId.getBytes() as List<int>),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.id.length,4,little:true,signed:true),this.id.map((x)=>readBufferFromBigInt(x,4,little:true,signed:true)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetMessages {
    static const CONSTRUCTOR_ID = 2911672867;
    static const SUBCLASS_OF_ID = 3568569182;
    final classType = "request";
    final ID = 2911672867;
	var channel;
	List<dynamic> id;


	GetMessages({this.channel, this.id});

	static GetMessages fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();reader.readInt();
List<dynamic> id = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		id.add(reader.tgReadObject());
}		return new GetMessages(channel : channel, id : id);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2911672867,4),(this.channel.getBytes() as List<int>),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.id.length,4,little:true,signed:true),this.id.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetParticipants {
    static const CONSTRUCTOR_ID = 306054633;
    static const SUBCLASS_OF_ID = 3859443300;
    final classType = "request";
    final ID = 306054633;
	var channel;
	var filter;
	int offset;
	int limit;
	int hash;


	GetParticipants({this.channel, this.filter, this.offset, this.limit, this.hash});

	static GetParticipants fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();var filter = reader.tgReadObject();var offset = reader.readInt();var limit = reader.readInt();var hash = reader.readInt();		return new GetParticipants(channel : channel, filter : filter, offset : offset, limit : limit, hash : hash);
	}
	List<int> getBytes(){return [readBufferFromBigInt(306054633,4),(this.channel.getBytes() as List<int>),(this.filter.getBytes() as List<int>),readBufferFromBigInt(this.offset,4,little:true,signed:true),readBufferFromBigInt(this.limit,4,little:true,signed:true),readBufferFromBigInt(this.hash,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetParticipant {
    static const CONSTRUCTOR_ID = 1416484774;
    static const SUBCLASS_OF_ID = 1717048602;
    final classType = "request";
    final ID = 1416484774;
	var channel;
	var userId;


	GetParticipant({this.channel, this.userId});

	static GetParticipant fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();var userId = reader.tgReadObject();		return new GetParticipant(channel : channel, userId : userId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1416484774,4),(this.channel.getBytes() as List<int>),(this.userId.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetChannels {
    static const CONSTRUCTOR_ID = 176122811;
    static const SUBCLASS_OF_ID = 2580925204;
    final classType = "request";
    final ID = 176122811;
	List<dynamic> id;


	GetChannels({this.id});

	static GetChannels fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<dynamic> id = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		id.add(reader.tgReadObject());
}		return new GetChannels(id : id);
	}
	List<int> getBytes(){return [readBufferFromBigInt(176122811,4),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.id.length,4,little:true,signed:true),this.id.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetFullChannel {
    static const CONSTRUCTOR_ID = 141781513;
    static const SUBCLASS_OF_ID = 576344329;
    final classType = "request";
    final ID = 141781513;
	var channel;


	GetFullChannel({this.channel});

	static GetFullChannel fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();		return new GetFullChannel(channel : channel);
	}
	List<int> getBytes(){return [readBufferFromBigInt(141781513,4),(this.channel.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class CreateChannel {
    static const CONSTRUCTOR_ID = 1029681423;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 1029681423;
	bool broadcast;
	bool megagroup;
	String title;
	String about;
	var geoPoint;
	String address;


	CreateChannel({this.broadcast, this.megagroup, this.title, this.about, this.geoPoint, this.address});

	static CreateChannel fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final broadcast = false;final megagroup = false;var title = reader.tgReadString();var about = reader.tgReadString();var geoPoint;if ((flags & 4)==1){var geoPoint = reader.tgReadObject(); } else {geoPoint=null;}var address;if ((flags & 4)==1){var address = reader.tgReadString(); } else {address=null;}		return new CreateChannel(broadcast : broadcast, megagroup : megagroup, title : title, about : about, geoPoint : geoPoint, address : address);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1029681423,4),[0,0,0,0],serializeBytes(this.title),serializeBytes(this.about),(this.geoPoint==null||this.geoPoint==false)?new List<int>():[(this.geoPoint.getBytes() as List<int>)].expand((element) => element).toList(),(this.address==null||this.address==false)?new List<int>():[serializeBytes(this.address)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class EditAdmin {
    static const CONSTRUCTOR_ID = 3543959810;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 3543959810;
	var channel;
	var userId;
	var adminRights;
	String rank;


	EditAdmin({this.channel, this.userId, this.adminRights, this.rank});

	static EditAdmin fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();var userId = reader.tgReadObject();var adminRights = reader.tgReadObject();var rank = reader.tgReadString();		return new EditAdmin(channel : channel, userId : userId, adminRights : adminRights, rank : rank);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3543959810,4),(this.channel.getBytes() as List<int>),(this.userId.getBytes() as List<int>),(this.adminRights.getBytes() as List<int>),serializeBytes(this.rank),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class EditTitle {
    static const CONSTRUCTOR_ID = 1450044624;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 1450044624;
	var channel;
	String title;


	EditTitle({this.channel, this.title});

	static EditTitle fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();var title = reader.tgReadString();		return new EditTitle(channel : channel, title : title);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1450044624,4),(this.channel.getBytes() as List<int>),serializeBytes(this.title),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class EditPhoto {
    static const CONSTRUCTOR_ID = 4046346185;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 4046346185;
	var channel;
	var photo;


	EditPhoto({this.channel, this.photo});

	static EditPhoto fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();var photo = reader.tgReadObject();		return new EditPhoto(channel : channel, photo : photo);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4046346185,4),(this.channel.getBytes() as List<int>),(this.photo.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class CheckUsername {
    static const CONSTRUCTOR_ID = 283557164;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 283557164;
	var channel;
	String username;


	CheckUsername({this.channel, this.username});

	static CheckUsername fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();var username = reader.tgReadString();		return new CheckUsername(channel : channel, username : username);
	}
	List<int> getBytes(){return [readBufferFromBigInt(283557164,4),(this.channel.getBytes() as List<int>),serializeBytes(this.username),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class UpdateUsername {
    static const CONSTRUCTOR_ID = 890549214;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 890549214;
	var channel;
	String username;


	UpdateUsername({this.channel, this.username});

	static UpdateUsername fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();var username = reader.tgReadString();		return new UpdateUsername(channel : channel, username : username);
	}
	List<int> getBytes(){return [readBufferFromBigInt(890549214,4),(this.channel.getBytes() as List<int>),serializeBytes(this.username),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class JoinChannel {
    static const CONSTRUCTOR_ID = 615851205;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 615851205;
	var channel;


	JoinChannel({this.channel});

	static JoinChannel fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();		return new JoinChannel(channel : channel);
	}
	List<int> getBytes(){return [readBufferFromBigInt(615851205,4),(this.channel.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class LeaveChannel {
    static const CONSTRUCTOR_ID = 4164332181;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 4164332181;
	var channel;


	LeaveChannel({this.channel});

	static LeaveChannel fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();		return new LeaveChannel(channel : channel);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4164332181,4),(this.channel.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class InviteToChannel {
    static const CONSTRUCTOR_ID = 429865580;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 429865580;
	var channel;
	List<dynamic> users;


	InviteToChannel({this.channel, this.users});

	static InviteToChannel fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();reader.readInt();
List<dynamic> users = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		users.add(reader.tgReadObject());
}		return new InviteToChannel(channel : channel, users : users);
	}
	List<int> getBytes(){return [readBufferFromBigInt(429865580,4),(this.channel.getBytes() as List<int>),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.users.length,4,little:true,signed:true),this.users.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class DeleteChannel {
    static const CONSTRUCTOR_ID = 3222347747;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 3222347747;
	var channel;


	DeleteChannel({this.channel});

	static DeleteChannel fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();		return new DeleteChannel(channel : channel);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3222347747,4),(this.channel.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ExportMessageLink {
    static const CONSTRUCTOR_ID = 3468128611;
    static const SUBCLASS_OF_ID = 3739632844;
    final classType = "request";
    final ID = 3468128611;
	var channel;
	int id;
	bool grouped;


	ExportMessageLink({this.channel, this.id, this.grouped});

	static ExportMessageLink fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();var id = reader.readInt();var grouped = reader.tgReadBool();		return new ExportMessageLink(channel : channel, id : id, grouped : grouped);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3468128611,4),(this.channel.getBytes() as List<int>),readBufferFromBigInt(this.id,4,little:true,signed:true),[this.grouped ? 0xb5757299 : 0x379779bc],].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ToggleSignatures {
    static const CONSTRUCTOR_ID = 527021574;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 527021574;
	var channel;
	bool enabled;


	ToggleSignatures({this.channel, this.enabled});

	static ToggleSignatures fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();var enabled = reader.tgReadBool();		return new ToggleSignatures(channel : channel, enabled : enabled);
	}
	List<int> getBytes(){return [readBufferFromBigInt(527021574,4),(this.channel.getBytes() as List<int>),[this.enabled ? 0xb5757299 : 0x379779bc],].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetAdminedPublicChannels {
    static const CONSTRUCTOR_ID = 4172297903;
    static const SUBCLASS_OF_ID = 2580925204;
    final classType = "request";
    final ID = 4172297903;
	bool byLocation;
	bool checkLimit;


	GetAdminedPublicChannels({this.byLocation, this.checkLimit});

	static GetAdminedPublicChannels fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final byLocation = false;final checkLimit = false;		return new GetAdminedPublicChannels(byLocation : byLocation, checkLimit : checkLimit);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4172297903,4),[0,0,0,0],].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class EditBanned {
    static const CONSTRUCTOR_ID = 1920559378;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 1920559378;
	var channel;
	var userId;
	var bannedRights;


	EditBanned({this.channel, this.userId, this.bannedRights});

	static EditBanned fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();var userId = reader.tgReadObject();var bannedRights = reader.tgReadObject();		return new EditBanned(channel : channel, userId : userId, bannedRights : bannedRights);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1920559378,4),(this.channel.getBytes() as List<int>),(this.userId.getBytes() as List<int>),(this.bannedRights.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetAdminLog {
    static const CONSTRUCTOR_ID = 870184064;
    static const SUBCLASS_OF_ID = 1374713532;
    final classType = "request";
    final ID = 870184064;
	var channel;
	String q;
	var eventsFilter;
	List<dynamic> admins;
	BigInt maxId;
	BigInt minId;
	int limit;


	GetAdminLog({this.channel, this.q, this.eventsFilter, this.admins, this.maxId, this.minId, this.limit});

	static GetAdminLog fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();var channel = reader.tgReadObject();var q = reader.tgReadString();var eventsFilter;if ((flags & 1)==1){var eventsFilter = reader.tgReadObject(); } else {eventsFilter=null;}var admins;if ((flags & 2)==1){reader.readInt();
List<dynamic> admins = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		admins.add(reader.tgReadObject());
} } else {admins=null;}var maxId = reader.readLong();var minId = reader.readLong();var limit = reader.readInt();		return new GetAdminLog(channel : channel, q : q, eventsFilter : eventsFilter, admins : admins, maxId : maxId, minId : minId, limit : limit);
	}
	List<int> getBytes(){return [readBufferFromBigInt(870184064,4),[0,0,0,0],(this.channel.getBytes() as List<int>),serializeBytes(this.q),(this.eventsFilter==null||this.eventsFilter==false)?new List<int>():[(this.eventsFilter.getBytes() as List<int>)].expand((element) => element).toList(),(this.admins==null||this.admins==false)?new List<int>():[readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.admins.length,4,little:true,signed:true),this.admins.map((x)=>(x.getBytes() as List<int>)).expand((element) => element)].expand((element) => element).toList(),readBufferFromBigInt(this.maxId,8,little:true,signed:true),readBufferFromBigInt(this.minId,8,little:true,signed:true),readBufferFromBigInt(this.limit,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SetStickers {
    static const CONSTRUCTOR_ID = 3935085817;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3935085817;
	var channel;
	var stickerset;


	SetStickers({this.channel, this.stickerset});

	static SetStickers fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();var stickerset = reader.tgReadObject();		return new SetStickers(channel : channel, stickerset : stickerset);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3935085817,4),(this.channel.getBytes() as List<int>),(this.stickerset.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ReadMessageContents {
    static const CONSTRUCTOR_ID = 3937786936;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 3937786936;
	var channel;
	List<int> id;


	ReadMessageContents({this.channel, this.id});

	static ReadMessageContents fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();reader.readInt();
List<int> id = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		id.add(reader.readInt());
}		return new ReadMessageContents(channel : channel, id : id);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3937786936,4),(this.channel.getBytes() as List<int>),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.id.length,4,little:true,signed:true),this.id.map((x)=>readBufferFromBigInt(x,4,little:true,signed:true)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class DeleteHistory {
    static const CONSTRUCTOR_ID = 2939592002;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 2939592002;
	var channel;
	int maxId;


	DeleteHistory({this.channel, this.maxId});

	static DeleteHistory fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();var maxId = reader.readInt();		return new DeleteHistory(channel : channel, maxId : maxId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2939592002,4),(this.channel.getBytes() as List<int>),readBufferFromBigInt(this.maxId,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class TogglePreHistoryHidden {
    static const CONSTRUCTOR_ID = 3938171212;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 3938171212;
	var channel;
	bool enabled;


	TogglePreHistoryHidden({this.channel, this.enabled});

	static TogglePreHistoryHidden fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();var enabled = reader.tgReadBool();		return new TogglePreHistoryHidden(channel : channel, enabled : enabled);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3938171212,4),(this.channel.getBytes() as List<int>),[this.enabled ? 0xb5757299 : 0x379779bc],].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetLeftChannels {
    static const CONSTRUCTOR_ID = 2202135744;
    static const SUBCLASS_OF_ID = 2580925204;
    final classType = "request";
    final ID = 2202135744;
	int offset;


	GetLeftChannels({this.offset});

	static GetLeftChannels fromReader(BinaryReader reader) {
	var temp,len;var offset = reader.readInt();		return new GetLeftChannels(offset : offset);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2202135744,4),readBufferFromBigInt(this.offset,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetGroupsForDiscussion {
    static const CONSTRUCTOR_ID = 4124758904;
    static const SUBCLASS_OF_ID = 2580925204;
    final classType = "request";
    final ID = 4124758904;


	GetGroupsForDiscussion();

	static GetGroupsForDiscussion fromReader(BinaryReader reader) {
	var temp,len;		return new GetGroupsForDiscussion();
	}
	List<int> getBytes(){return [readBufferFromBigInt(4124758904,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SetDiscussionGroup {
    static const CONSTRUCTOR_ID = 1079520178;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 1079520178;
	var broadcast;
	var group;


	SetDiscussionGroup({this.broadcast, this.group});

	static SetDiscussionGroup fromReader(BinaryReader reader) {
	var temp,len;var broadcast = reader.tgReadObject();var group = reader.tgReadObject();		return new SetDiscussionGroup(broadcast : broadcast, group : group);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1079520178,4),(this.broadcast.getBytes() as List<int>),(this.group.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class EditCreator {
    static const CONSTRUCTOR_ID = 2402864415;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 2402864415;
	var channel;
	var userId;
	var password;


	EditCreator({this.channel, this.userId, this.password});

	static EditCreator fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();var userId = reader.tgReadObject();var password = reader.tgReadObject();		return new EditCreator(channel : channel, userId : userId, password : password);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2402864415,4),(this.channel.getBytes() as List<int>),(this.userId.getBytes() as List<int>),(this.password.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class EditLocation {
    static const CONSTRUCTOR_ID = 1491484525;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 1491484525;
	var channel;
	var geoPoint;
	String address;


	EditLocation({this.channel, this.geoPoint, this.address});

	static EditLocation fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();var geoPoint = reader.tgReadObject();var address = reader.tgReadString();		return new EditLocation(channel : channel, geoPoint : geoPoint, address : address);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1491484525,4),(this.channel.getBytes() as List<int>),(this.geoPoint.getBytes() as List<int>),serializeBytes(this.address),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class ToggleSlowMode {
    static const CONSTRUCTOR_ID = 3990134512;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 3990134512;
	var channel;
	int seconds;


	ToggleSlowMode({this.channel, this.seconds});

	static ToggleSlowMode fromReader(BinaryReader reader) {
	var temp,len;var channel = reader.tgReadObject();var seconds = reader.readInt();		return new ToggleSlowMode(channel : channel, seconds : seconds);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3990134512,4),(this.channel.getBytes() as List<int>),readBufferFromBigInt(this.seconds,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetInactiveChannels {
    static const CONSTRUCTOR_ID = 300429806;
    static const SUBCLASS_OF_ID = 2348013524;
    final classType = "request";
    final ID = 300429806;


	GetInactiveChannels();

	static GetInactiveChannels fromReader(BinaryReader reader) {
	var temp,len;		return new GetInactiveChannels();
	}
	List<int> getBytes(){return [readBufferFromBigInt(300429806,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}