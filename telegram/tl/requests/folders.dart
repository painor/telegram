import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class EditPeerFolders {
    static const CONSTRUCTOR_ID = 1749536939;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 1749536939;
	List<dynamic> folderPeers;


	EditPeerFolders({this.folderPeers});

	static EditPeerFolders fromReader(BinaryReader reader) {
	var temp,len;reader.readInt();
List<dynamic> folderPeers = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		folderPeers.add(reader.tgReadObject());
}		return new EditPeerFolders(folderPeers : folderPeers);
	}
	List<int> getBytes(){return [readBufferFromBigInt(1749536939,4),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.folderPeers.length,4,little:true,signed:true),this.folderPeers.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}

class DeleteFolder {
    static const CONSTRUCTOR_ID = 472471681;
    static const SUBCLASS_OF_ID = 2331323052;
    final classType = "request";
    final ID = 472471681;
	int folderId;


	DeleteFolder({this.folderId});

	static DeleteFolder fromReader(BinaryReader reader) {
	var temp,len;var folderId = reader.readInt();		return new DeleteFolder(folderId : folderId);
	}
	List<int> getBytes(){return [readBufferFromBigInt(472471681,4),readBufferFromBigInt(this.folderId,4,little:true,signed:true),].expand((element) => element).toList();}
	readResult(BinaryReader reader) {
	return reader.tgReadObject();
	}

}