import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class GetBroadcastStats {
    static const CONSTRUCTOR_ID = 3861908922;
    static const SUBCLASS_OF_ID = 2146587688;
    final classType = "request";
    final ID = 3861908922;
	bool dark;
	var channel;
	int tzOffset;


	GetBroadcastStats({this.dark, this.channel, this.tzOffset});

	static GetBroadcastStats fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final dark = false;var channel = reader.tgReadObject();var tzOffset = reader.readInt();		return new GetBroadcastStats(dark : dark, channel : channel, tzOffset : tzOffset);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3861908922,4),[0,0,0,0],(this.channel.getBytes() as List<int>),readBufferFromBigInt(this.tzOffset,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class LoadAsyncGraph {
    static const CONSTRUCTOR_ID = 1646092192;
    static const SUBCLASS_OF_ID = 2609918291;
    final classType = "request";
    final ID = 1646092192;
	String token;
	BigInt x;


	LoadAsyncGraph({this.token, this.x});

	static LoadAsyncGraph fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();var token = reader.tgReadString();var x;if ((flags & 1)==1){var x = reader.readLong(); } else {x=null;}		return new LoadAsyncGraph(token : token, x : x);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1646092192,4),[0,0,0,0],serializeBytes(this.token),(this.x==null||this.x==false)?new List<int>():[readBufferFromBigInt(this.x,8,little:true,signed:true)].expand((element) => element).toList(),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}