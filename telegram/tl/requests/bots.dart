import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class SendCustomRequest {
    static const CONSTRUCTOR_ID = 2854709741;
    static const SUBCLASS_OF_ID = 2902676200;
	String customMethod;
	var params;


	SendCustomRequest({this.customMethod, this.params});

	static SendCustomRequest fromReader(BinaryReader reader) {
	var temp,len;var customMethod = reader.tgReadString();var params = reader.tgReadObject();		return new SendCustomRequest(customMethod : customMethod, params : params);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2854709741,4),serializeBytes(this.customMethod),this.params.getBytes(),].expand((element) => element).toList();}

}

class AnswerWebhookJSONQuery {
    static const CONSTRUCTOR_ID = 3860938573;
    static const SUBCLASS_OF_ID = 4122188204;
	BigInt queryId;
	var data;


	AnswerWebhookJSONQuery({this.queryId, this.data});

	static AnswerWebhookJSONQuery fromReader(BinaryReader reader) {
	var temp,len;var queryId = reader.readLong();var data = reader.tgReadObject();		return new AnswerWebhookJSONQuery(queryId : queryId, data : data);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3860938573,4),readBufferFromBigInt(this.queryId,8,little:true,signed:true),this.data.getBytes(),].expand((element) => element).toList();}

}

class SetBotCommands {
    static const CONSTRUCTOR_ID = 2153596662;
    static const SUBCLASS_OF_ID = 4122188204;
	List<dynamic> commands;


	SetBotCommands({this.commands});

	static SetBotCommands fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<dynamic> commands = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		commands.add(reader.tgReadObject());
}		return new SetBotCommands(commands : commands);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2153596662,4),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.commands.length,4,little:true,signed:true),this.commands.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}