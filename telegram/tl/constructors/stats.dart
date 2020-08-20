import '../../utils.dart';
import '../../extensions/binary_reader.dart';

class BroadcastStats {
    static const CONSTRUCTOR_ID = 3187114900;
    static const SUBCLASS_OF_ID = 2146587688;
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
	List<int> getBytes(){return [readBufferFromBigInt(3187114900,4),this.period.getBytes(),this.followers.getBytes(),this.viewsPerPost.getBytes(),this.sharesPerPost.getBytes(),this.enabledNotifications.getBytes(),this.growthGraph.getBytes(),this.followersGraph.getBytes(),this.muteGraph.getBytes(),this.topHoursGraph.getBytes(),this.interactionsGraph.getBytes(),this.ivInteractionsGraph.getBytes(),this.viewsBySourceGraph.getBytes(),this.newFollowersBySourceGraph.getBytes(),this.languagesGraph.getBytes(),readBufferFromBigInt(0x15c4b51c,4),readBufferFromBigInt(this.recentMessageInteractions.length,4,little:true,signed:true),this.recentMessageInteractions.map((x)=>x.getBytes()),].expand((element) => element).toList();}

}