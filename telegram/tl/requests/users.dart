import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class GetUsers {
    static const CONSTRUCTOR_ID = 227648840;
    static const SUBCLASS_OF_ID = 67557965;
    final classType = "request";
    final ID = 227648840;
	List<dynamic> id;


	GetUsers({this.id});

	static GetUsers fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<dynamic> id = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		id.add(reader.tgReadObject());
}		return new GetUsers(id : id);
	}
	List<int> getBytes(){return [readBufferFromBigInt(227648840,4),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.id.length,4,little:true,signed:true),this.id.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class GetFullUser {
    static const CONSTRUCTOR_ID = 3392185777;
    static const SUBCLASS_OF_ID = 524706233;
    final classType = "request";
    final ID = 3392185777;
	var id;


	GetFullUser({this.id});

	static GetFullUser fromReader(BinaryReader reader) {
	var temp,len;var id = reader.tgReadObject();		return new GetFullUser(id : id);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3392185777,4),(this.id.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class SetSecureValueErrors {
    static const CONSTRUCTOR_ID = 2429064373;
    static const SUBCLASS_OF_ID = 4122188204;
    final classType = "request";
    final ID = 2429064373;
	var id;
	List<dynamic> errors;


	SetSecureValueErrors({this.id, this.errors});

	static SetSecureValueErrors fromReader(BinaryReader reader) {
	var temp,len;var id = reader.tgReadObject();reader.readInt();
List<dynamic> errors = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		errors.add(reader.tgReadObject());
}		return new SetSecureValueErrors(id : id, errors : errors);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2429064373,4),(this.id.getBytes() as List<int>),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.errors.length,4,little:true,signed:true),this.errors.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}