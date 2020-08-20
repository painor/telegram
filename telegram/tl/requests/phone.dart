import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class GetCallConfig {
    static const CONSTRUCTOR_ID = 1430593449;
    static const SUBCLASS_OF_ID = 2902676200;


	GetCallConfig();

	static GetCallConfig fromReader(BinaryReader reader) {
	var temp,len;		return new GetCallConfig();
	}
	List<int> getBytes(){return [readBufferFromBigInt(1430593449,4),].expand((element) => element).toList();}

}

class RequestCall {
    static const CONSTRUCTOR_ID = 1124046573;
    static const SUBCLASS_OF_ID = 3565878863;
	bool video;
	var userId;
	int randomId;
	List<int> gAHash;
	var protocol;


	RequestCall({this.video, this.userId, this.randomId, this.gAHash, this.protocol});

	static RequestCall fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final video = false;var userId = reader.tgReadObject();var randomId = reader.readInt();var gAHash = reader.tgReadBytes();var protocol = reader.tgReadObject();		return new RequestCall(video : video, userId : userId, randomId : randomId, gAHash : gAHash, protocol : protocol);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1124046573,4),[0,0,0,0],this.userId.getBytes(),readBufferFromBigInt(this.randomId,4,little:true,signed:true),serializeBytes(this.gAHash),this.protocol.getBytes(),].expand((element) => element).toList();}

}

class AcceptCall {
    static const CONSTRUCTOR_ID = 1003664544;
    static const SUBCLASS_OF_ID = 3565878863;
	var peer;
	List<int> gB;
	var protocol;


	AcceptCall({this.peer, this.gB, this.protocol});

	static AcceptCall fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var gB = reader.tgReadBytes();var protocol = reader.tgReadObject();		return new AcceptCall(peer : peer, gB : gB, protocol : protocol);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1003664544,4),this.peer.getBytes(),serializeBytes(this.gB),this.protocol.getBytes(),].expand((element) => element).toList();}

}

class ConfirmCall {
    static const CONSTRUCTOR_ID = 788404002;
    static const SUBCLASS_OF_ID = 3565878863;
	var peer;
	List<int> gA;
	BigInt keyFingerprint;
	var protocol;


	ConfirmCall({this.peer, this.gA, this.keyFingerprint, this.protocol});

	static ConfirmCall fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var gA = reader.tgReadBytes();var keyFingerprint = reader.readLong();var protocol = reader.tgReadObject();		return new ConfirmCall(peer : peer, gA : gA, keyFingerprint : keyFingerprint, protocol : protocol);
	}
	List<int> getBytes(){return [readBufferFromBigInt(788404002,4),this.peer.getBytes(),serializeBytes(this.gA),readBufferFromBigInt(this.keyFingerprint,8,little:true,signed:true),this.protocol.getBytes(),].expand((element) => element).toList();}

}

class ReceivedCall {
    static const CONSTRUCTOR_ID = 399855457;
    static const SUBCLASS_OF_ID = 4122188204;
	var peer;


	ReceivedCall({this.peer});

	static ReceivedCall fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();		return new ReceivedCall(peer : peer);
	}
	List<int> getBytes(){return [readBufferFromBigInt(399855457,4),this.peer.getBytes(),].expand((element) => element).toList();}

}

class DiscardCall {
    static const CONSTRUCTOR_ID = 2999697856;
    static const SUBCLASS_OF_ID = 2331323052;
	bool video;
	var peer;
	int duration;
	var reason;
	BigInt connectionId;


	DiscardCall({this.video, this.peer, this.duration, this.reason, this.connectionId});

	static DiscardCall fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final video = false;var peer = reader.tgReadObject();var duration = reader.readInt();var reason = reader.tgReadObject();var connectionId = reader.readLong();		return new DiscardCall(video : video, peer : peer, duration : duration, reason : reason, connectionId : connectionId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2999697856,4),[0,0,0,0],this.peer.getBytes(),readBufferFromBigInt(this.duration,4,little:true,signed:true),this.reason.getBytes(),readBufferFromBigInt(this.connectionId,8,little:true,signed:true),].expand((element) => element).toList();}

}

class SetCallRating {
    static const CONSTRUCTOR_ID = 1508562471;
    static const SUBCLASS_OF_ID = 2331323052;
	bool userInitiative;
	var peer;
	int rating;
	String comment;


	SetCallRating({this.userInitiative, this.peer, this.rating, this.comment});

	static SetCallRating fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final userInitiative = false;var peer = reader.tgReadObject();var rating = reader.readInt();var comment = reader.tgReadString();		return new SetCallRating(userInitiative : userInitiative, peer : peer, rating : rating, comment : comment);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1508562471,4),[0,0,0,0],this.peer.getBytes(),readBufferFromBigInt(this.rating,4,little:true,signed:true),serializeBytes(this.comment),].expand((element) => element).toList();}

}

class SaveCallDebug {
    static const CONSTRUCTOR_ID = 662363518;
    static const SUBCLASS_OF_ID = 4122188204;
	var peer;
	var debug;


	SaveCallDebug({this.peer, this.debug});

	static SaveCallDebug fromReader(BinaryReader reader) {
	var temp,len;var peer = reader.tgReadObject();var debug = reader.tgReadObject();		return new SaveCallDebug(peer : peer, debug : debug);
	}
	List<int> getBytes(){return [readBufferFromBigInt(662363518,4),this.peer.getBytes(),this.debug.getBytes(),].expand((element) => element).toList();}

}