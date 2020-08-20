import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class CreateStickerSet {
    static const CONSTRUCTOR_ID = 4043532160;
    static const SUBCLASS_OF_ID = 2607827546;
	bool masks;
	bool animated;
	var userId;
	String title;
	String shortName;
	var thumb;
	List<dynamic> stickers;


	CreateStickerSet({this.masks, this.animated, this.userId, this.title, this.shortName, this.thumb, this.stickers});

	static CreateStickerSet fromReader(BinaryReader reader) {
	var temp,len;final flags = reader.readInt();final masks = false;final animated = false;var userId = reader.tgReadObject();var title = reader.tgReadString();var shortName = reader.tgReadString();var thumb;if ((flags & 4)==1){var thumb = reader.tgReadObject(); } else {thumb=null;}reader.readInt();
List<dynamic> stickers = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		stickers.add(reader.tgReadObject());
}		return new CreateStickerSet(masks : masks, animated : animated, userId : userId, title : title, shortName : shortName, thumb : thumb, stickers : stickers);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4043532160,4),[0,0,0,0],this.userId.getBytes(),serializeBytes(this.title),serializeBytes(this.shortName),(this.thumb==null||this.thumb==false)?[]:[this.thumb.getBytes()],readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.stickers.length,4,little:true,signed:true),this.stickers.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}

class RemoveStickerFromSet {
    static const CONSTRUCTOR_ID = 4151709521;
    static const SUBCLASS_OF_ID = 2607827546;
	var sticker;


	RemoveStickerFromSet({this.sticker});

	static RemoveStickerFromSet fromReader(BinaryReader reader) {
	var temp,len;var sticker = reader.tgReadObject();		return new RemoveStickerFromSet(sticker : sticker);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4151709521,4),this.sticker.getBytes(),].expand((element) => element).toList();}

}

class ChangeStickerPosition {
    static const CONSTRUCTOR_ID = 4290172106;
    static const SUBCLASS_OF_ID = 2607827546;
	var sticker;
	int position;


	ChangeStickerPosition({this.sticker, this.position});

	static ChangeStickerPosition fromReader(BinaryReader reader) {
	var temp,len;var sticker = reader.tgReadObject();var position = reader.readInt();		return new ChangeStickerPosition(sticker : sticker, position : position);
	}
	List<int> getBytes(){return [readBufferFromBigInt(4290172106,4),this.sticker.getBytes(),readBufferFromBigInt(this.position,4,little:true,signed:true),].expand((element) => element).toList();}

}

class AddStickerToSet {
    static const CONSTRUCTOR_ID = 2253651646;
    static const SUBCLASS_OF_ID = 2607827546;
	var stickerset;
	var sticker;


	AddStickerToSet({this.stickerset, this.sticker});

	static AddStickerToSet fromReader(BinaryReader reader) {
	var temp,len;var stickerset = reader.tgReadObject();var sticker = reader.tgReadObject();		return new AddStickerToSet(stickerset : stickerset, sticker : sticker);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2253651646,4),this.stickerset.getBytes(),this.sticker.getBytes(),].expand((element) => element).toList();}

}

class SetStickerSetThumb {
    static const CONSTRUCTOR_ID = 2587250224;
    static const SUBCLASS_OF_ID = 2607827546;
	var stickerset;
	var thumb;


	SetStickerSetThumb({this.stickerset, this.thumb});

	static SetStickerSetThumb fromReader(BinaryReader reader) {
	var temp,len;var stickerset = reader.tgReadObject();var thumb = reader.tgReadObject();		return new SetStickerSetThumb(stickerset : stickerset, thumb : thumb);
	}
	List<int> getBytes(){return [readBufferFromBigInt(2587250224,4),this.stickerset.getBytes(),this.thumb.getBytes(),].expand((element) => element).toList();}

}