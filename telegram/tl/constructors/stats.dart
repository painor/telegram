import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class BroadcastStats {
    static const CONSTRUCTOR_ID = 3187114900;
    static const SUBCLASS_OF_ID = 2146587688;
    final classType = "constructor";
    final ID = 3187114900;
	var period;
	var followers;
	var viewsPerPost;
	var sharesPerPost;
	var enabledNotifications;
	var growthGraph;
	var followersGraph;
	var muteGraph;
	var topHoursGraph;
	var interactionsGraph;
	var ivInteractionsGraph;
	var viewsBySourceGraph;
	var newFollowersBySourceGraph;
	var languagesGraph;
	List<dynamic> recentMessageInteractions;


	BroadcastStats({this.period, this.followers, this.viewsPerPost, this.sharesPerPost, this.enabledNotifications, this.growthGraph, this.followersGraph, this.muteGraph, this.topHoursGraph, this.interactionsGraph, this.ivInteractionsGraph, this.viewsBySourceGraph, this.newFollowersBySourceGraph, this.languagesGraph, this.recentMessageInteractions});

	static BroadcastStats fromReader(BinaryReader reader) {
	var temp,len;var period = reader.tgReadObject();var followers = reader.tgReadObject();var viewsPerPost = reader.tgReadObject();var sharesPerPost = reader.tgReadObject();var enabledNotifications = reader.tgReadObject();var growthGraph = reader.tgReadObject();var followersGraph = reader.tgReadObject();var muteGraph = reader.tgReadObject();var topHoursGraph = reader.tgReadObject();var interactionsGraph = reader.tgReadObject();var ivInteractionsGraph = reader.tgReadObject();var viewsBySourceGraph = reader.tgReadObject();var newFollowersBySourceGraph = reader.tgReadObject();var languagesGraph = reader.tgReadObject();reader.readInt();
List<dynamic> recentMessageInteractions = [];len = reader.readInt();
	for (var i=0;i<len;i++){
		recentMessageInteractions.add(reader.tgReadObject());
}		return new BroadcastStats(period : period, followers : followers, viewsPerPost : viewsPerPost, sharesPerPost : sharesPerPost, enabledNotifications : enabledNotifications, growthGraph : growthGraph, followersGraph : followersGraph, muteGraph : muteGraph, topHoursGraph : topHoursGraph, interactionsGraph : interactionsGraph, ivInteractionsGraph : ivInteractionsGraph, viewsBySourceGraph : viewsBySourceGraph, newFollowersBySourceGraph : newFollowersBySourceGraph, languagesGraph : languagesGraph, recentMessageInteractions : recentMessageInteractions);
	}
	List<int> getBytes(){return [readBufferFromBigInt(3187114900,4),(this.period.getBytes() as List<int>),(this.followers.getBytes() as List<int>),(this.viewsPerPost.getBytes() as List<int>),(this.sharesPerPost.getBytes() as List<int>),(this.enabledNotifications.getBytes() as List<int>),(this.growthGraph.getBytes() as List<int>),(this.followersGraph.getBytes() as List<int>),(this.muteGraph.getBytes() as List<int>),(this.topHoursGraph.getBytes() as List<int>),(this.interactionsGraph.getBytes() as List<int>),(this.ivInteractionsGraph.getBytes() as List<int>),(this.viewsBySourceGraph.getBytes() as List<int>),(this.newFollowersBySourceGraph.getBytes() as List<int>),(this.languagesGraph.getBytes() as List<int>),readBufferFromBigInt(0x15c4b51c,4,little:false,signed:false),readBufferFromBigInt(this.recentMessageInteractions.length,4,little:true,signed:true),this.recentMessageInteractions.map((x)=>(x.getBytes() as List<int>)).expand((element) => element),].expand((element) => element).toList();}

}