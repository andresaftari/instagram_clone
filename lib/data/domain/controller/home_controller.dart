import 'package:get/get.dart';
import 'package:instagram_clone/data/domain/repository/home_repository.dart';
import 'package:instagram_clone/models/feeds.dart';
import 'package:instagram_clone/models/story.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository = HomeRepository();

  var storyObsList = List<UserStory>.empty(growable: true).obs;
  var feedsObsList = List<Feeds>.empty(growable: true).obs;

  var isFeedLiked = false.obs;

  void toggleLikedFeed(var id) {
    this.isFeedLiked.value = _homeRepository.isFeedLiked.value;
    _homeRepository.toggleLikedFeed(id);
  }

  Future<List<UserStory>> getUserStories() async {
    return _homeRepository.getUserStories().then((value) {
      // print('Story: Controller Passed');

      storyObsList.assignAll(value);
      return value;
    });
  }

  Future<List<Feeds>> getFeeds() async {
    return _homeRepository.getFeeds().then((value) {
      // print('Feeds: Controller Passed');

      feedsObsList.assignAll(value);
      return value;
    });
  }
}
