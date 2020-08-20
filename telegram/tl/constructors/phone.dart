import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class PhoneCall {
    static const CONSTRUCTOR_ID = 3968000320;
    static const SUBCLASS_OF_ID = 3565878863;
	var phoneCall;
	List<dynamic> users;


	PhoneCall({this.phoneCall, this.users});

	static PhoneCall fromReader(BinaryReader reader) {
	var temp,len;var phoneCall = reader.tgReadObject();reader.readInt();
List<dynamic> users = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		users.add(reader.tgReadObject());
}		return new PhoneCall(phoneCall : phoneCall, users : users);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3968000320,4),this.phoneCall.getBytes(),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.users.length,4,little:true,signed:true),this.users.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}