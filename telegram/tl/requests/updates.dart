// @dart=2.10
import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class GetState {
    static const CONSTRUCTOR_ID = 3990128682;
    static const SUBCLASS_OF_ID = 601823745;
    final classType = "request";
    final ID = 3990128682;


	GetState();

	static GetState fromReader(BinaryReader reader) {
	var temp,len;		return new GetState();
	}
	List<int> getBytes(){return [readBufferFromBigInt(3990128682,4),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetDifference {
    static const CONSTRUCTOR_ID = 630429265;
    static const SUBCLASS_OF_ID = 541599860;
    final classType = "request";
    final ID = 630429265;
	int pts;
	int ptsTotalLimit;
	int date;
	int qts;


	GetDifference({this.pts, this.ptsTotalLimit, this.date, this.qts});

	static GetDifference fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();var pts = reader.readInt();var ptsTotalLimit;if ((flags & 1)==1){var ptsTotalLimit = reader.readInt(); } else {ptsTotalLimit=null;}var date = reader.readInt();var qts = reader.readInt();		return new GetDifference(pts : pts, ptsTotalLimit : ptsTotalLimit, date : date, qts : qts);
	}
	List<int> getBytes(){return [readBufferFromBigInt(630429265,4),[0,0,0,0],readBufferFromBigInt(this.pts,4,little:true,signed:true),(this.ptsTotalLimit==null||this.ptsTotalLimit==false)?new List<int>():[readBufferFromBigInt(this.ptsTotalLimit,4,little:true,signed:true)].expand((element) => element).toList(),readBufferFromBigInt(this.date,4,little:true,signed:true),readBufferFromBigInt(this.qts,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetChannelDifference {
    static const CONSTRUCTOR_ID = 51854712;
    static const SUBCLASS_OF_ID = 696872797;
    final classType = "request";
    final ID = 51854712;
	bool force;
	var channel;
	var filter;
	int pts;
	int limit;


	GetChannelDifference({this.force, this.channel, this.filter, this.pts, this.limit});

	static GetChannelDifference fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final force = false;var channel = reader.tgReadObject();var filter = reader.tgReadObject();var pts = reader.readInt();var limit = reader.readInt();		return new GetChannelDifference(force : force, channel : channel, filter : filter, pts : pts, limit : limit);
	}
	List<int> getBytes(){return [readBufferFromBigInt(51854712,4),[0,0,0,0],(this.channel.getBytes() as List<int>),(this.filter.getBytes() as List<int>),readBufferFromBigInt(this.pts,4,little:true,signed:true),readBufferFromBigInt(this.limit,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}