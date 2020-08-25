import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class UpdateProfilePhoto {
    static const CONSTRUCTOR_ID = 4038807890;
    static const SUBCLASS_OF_ID = 3325267837;
    final classType = "request";
    final ID = 4038807890;
	var id;


	UpdateProfilePhoto({this.id});

	static UpdateProfilePhoto fromReader(BinaryReader reader) {
	var temp,len;var id = reader.tgReadObject();		return new UpdateProfilePhoto(id : id);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4038807890,4),(this.id.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class UploadProfilePhoto {
    static const CONSTRUCTOR_ID = 1328726168;
    static const SUBCLASS_OF_ID = 3264396580;
    final classType = "request";
    final ID = 1328726168;
	var file;


	UploadProfilePhoto({this.file});

	static UploadProfilePhoto fromReader(BinaryReader reader) {
	var temp,len;var file = reader.tgReadObject();		return new UploadProfilePhoto(file : file);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1328726168,4),(this.file.getBytes() as List<int>),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class DeletePhotos {
    static const CONSTRUCTOR_ID = 2278522671;
    static const SUBCLASS_OF_ID = 2300109160;
    final classType = "request";
    final ID = 2278522671;
	List<dynamic> id;


	DeletePhotos({this.id});

	static DeletePhotos fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<dynamic> id = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		id.add(reader.tgReadObject());
}		return new DeletePhotos(id : id);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2278522671,4),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.id.length,4,little:true,signed:true),this.id.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}
	List<BigInt> readResult(BinaryReader reader) {
	
reader.readInt();
final range = reader.readInt();
final List<BigInt> result = [];
 for (int i=0;i<range;i++){
	result.add(reader.readLong());}
	}

}

class GetUserPhotos {
    static const CONSTRUCTOR_ID = 2446144168;
    static const SUBCLASS_OF_ID = 667924839;
    final classType = "request";
    final ID = 2446144168;
	var userId;
	int offset;
	BigInt maxId;
	int limit;


	GetUserPhotos({this.userId, this.offset, this.maxId, this.limit});

	static GetUserPhotos fromReader(BinaryReader reader) {
	var temp,len;var userId = reader.tgReadObject();var offset = reader.readInt();var maxId = reader.readLong();var limit = reader.readInt();		return new GetUserPhotos(userId : userId, offset : offset, maxId : maxId, limit : limit);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2446144168,4),(this.userId.getBytes() as List<int>),readBufferFromBigInt(this.offset,4,little:true,signed:true),readBufferFromBigInt(this.maxId,8,little:true,signed:true),readBufferFromBigInt(this.limit,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}