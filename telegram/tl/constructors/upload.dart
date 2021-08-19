// @dart=2.10
import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class File {
    static const CONSTRUCTOR_ID = 157948117;
    static const SUBCLASS_OF_ID = 1822152488;
    final classType = "constructor";
    final ID = 157948117;
	var type;
	int mtime;
	List<int> bytes;


	File({this.type, this.mtime, this.bytes});

	static File fromReader(BinaryReader reader) {
	var temp,len;var type = reader.tgReadObject();var mtime = reader.readInt();var bytes = reader.tgReadBytes();		return new File(type : type, mtime : mtime, bytes : bytes);
	}
	List<int> getBytes(){return [readBufferFromBigInt(157948117,4),(this.type.getBytes() as List<int>),readBufferFromBigInt(this.mtime,4,little:true,signed:true),serializeBytes(this.bytes),].expand((element) => element).toList();}

}

class FileCdnRedirect {
    static const CONSTRUCTOR_ID = 4052539972;
    static const SUBCLASS_OF_ID = 1822152488;
    final classType = "constructor";
    final ID = 4052539972;
	int dcId;
	List<int> fileToken;
	List<int> encryptionKey;
	List<int> encryptionIv;
	List<dynamic> fileHashes;


	FileCdnRedirect({this.dcId, this.fileToken, this.encryptionKey, this.encryptionIv, this.fileHashes});

	static FileCdnRedirect fromReader(BinaryReader reader) {
	var temp,len;var dcId = reader.readInt();var fileToken = reader.tgReadBytes();var encryptionKey = reader.tgReadBytes();var encryptionIv = reader.tgReadBytes();reader.readInt();
List<dynamic> fileHashes = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		fileHashes.add(reader.tgReadObject());
}		return new FileCdnRedirect(dcId : dcId, fileToken : fileToken, encryptionKey : encryptionKey, encryptionIv : encryptionIv, fileHashes : fileHashes);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4052539972,4),readBufferFromBigInt(this.dcId,4,little:true,signed:true),serializeBytes(this.fileToken),serializeBytes(this.encryptionKey),serializeBytes(this.encryptionIv),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.fileHashes.length,4,little:true,signed:true),this.fileHashes.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}

}

class WebFile {
    static const CONSTRUCTOR_ID = 568808380;
    static const SUBCLASS_OF_ID = 1760657233;
    final classType = "constructor";
    final ID = 568808380;
	int size;
	String mimeType;
	var fileType;
	int mtime;
	List<int> bytes;


	WebFile({this.size, this.mimeType, this.fileType, this.mtime, this.bytes});

	static WebFile fromReader(BinaryReader reader) {
	var temp,len;var size = reader.readInt();var mimeType = reader.tgReadString();var fileType = reader.tgReadObject();var mtime = reader.readInt();var bytes = reader.tgReadBytes();		return new WebFile(size : size, mimeType : mimeType, fileType : fileType, mtime : mtime, bytes : bytes);
	}
	List<int> getBytes(){return [readBufferFromBigInt(568808380,4),readBufferFromBigInt(this.size,4,little:true,signed:true),serializeBytes(this.mimeType),(this.fileType.getBytes() as List<int>),readBufferFromBigInt(this.mtime,4,little:true,signed:true),serializeBytes(this.bytes),].expand((element) => element).toList();}

}

class CdnFileReuploadNeeded {
    static const CONSTRUCTOR_ID = 4004045934;
    static const SUBCLASS_OF_ID = 4123851048;
    final classType = "constructor";
    final ID = 4004045934;
	List<int> requestToken;


	CdnFileReuploadNeeded({this.requestToken});

	static CdnFileReuploadNeeded fromReader(BinaryReader reader) {
	var temp,len;var requestToken = reader.tgReadBytes();		return new CdnFileReuploadNeeded(requestToken : requestToken);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4004045934,4),serializeBytes(this.requestToken),].expand((element) => element).toList();}

}

class CdnFile {
    static const CONSTRUCTOR_ID = 2845821519;
    static const SUBCLASS_OF_ID = 4123851048;
    final classType = "constructor";
    final ID = 2845821519;
	List<int> bytes;


	CdnFile({this.bytes});

	static CdnFile fromReader(BinaryReader reader) {
	var temp,len;var bytes = reader.tgReadBytes();		return new CdnFile(bytes : bytes);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2845821519,4),serializeBytes(this.bytes),].expand((element) => element).toList();}

}