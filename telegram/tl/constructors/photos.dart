// @dart=2.10
import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class Photos {
    static const CONSTRUCTOR_ID = 2378853029;
    static const SUBCLASS_OF_ID = 667924839;
    final classType = "constructor";
    final ID = 2378853029;
	List<dynamic> photos;
	List<dynamic> users;


	Photos({this.photos, this.users});

	static Photos fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<dynamic> photos = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		photos.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> users = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		users.add(reader.tgReadObject());
}		return new Photos(photos : photos, users : users);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2378853029,4),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.photos.length,4,little:true,signed:true),this.photos.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.users.length,4,little:true,signed:true),this.users.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}

}

class PhotosSlice {
    static const CONSTRUCTOR_ID = 352657236;
    static const SUBCLASS_OF_ID = 667924839;
    final classType = "constructor";
    final ID = 352657236;
	int count;
	List<dynamic> photos;
	List<dynamic> users;


	PhotosSlice({this.count, this.photos, this.users});

	static PhotosSlice fromReader(BinaryReader reader) {
	var temp,len;var count = reader.readInt();reader.readInt();
List<dynamic> photos = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		photos.add(reader.tgReadObject());
}reader.readInt();
List<dynamic> users = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		users.add(reader.tgReadObject());
}		return new PhotosSlice(count : count, photos : photos, users : users);
	}
	List<int> getBytes(){return [readBufferFromBigInt(352657236,4),readBufferFromBigInt(this.count,4,little:true,signed:true),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.photos.length,4,little:true,signed:true),this.photos.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.users.length,4,little:true,signed:true),this.users.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}

}

class Photo {
    static const CONSTRUCTOR_ID = 539045032;
    static const SUBCLASS_OF_ID = 3264396580;
    final classType = "constructor";
    final ID = 539045032;
	var photo;
	List<dynamic> users;


	Photo({this.photo, this.users});

	static Photo fromReader(BinaryReader reader) {
	var temp,len;var photo = reader.tgReadObject();reader.readInt();
List<dynamic> users = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		users.add(reader.tgReadObject());
}		return new Photo(photo : photo, users : users);
	}
	List<int> getBytes(){return [readBufferFromBigInt(539045032,4),(this.photo.getBytes() as List<int>),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.users.length,4,little:true,signed:true),this.users.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}

}