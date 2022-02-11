import 'package:get/get.dart';
import 'package:instagram_clone/data/domain/client/home_client.dart';
import 'package:instagram_clone/models/feeds.dart';
import 'package:instagram_clone/models/story.dart';

class HomeRepository {
  final HomeClient _homeClient = HomeClient();
  var isFeedLiked = false.obs;

  Future getUserStories() async {
    return _homeClient.getUserStories();
  }

  Future<List<Feeds>> getFeeds() async {
    return _homeClient.getFeeds();
  }

  void toggleLikedFeed(var id) {
    _homeClient.toggleLikedFeed(id);
    this.isFeedLiked.value = _homeClient.isFeedLiked.value;
  }
}
