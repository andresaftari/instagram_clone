import 'package:get/get.dart';
import 'package:instagram_clone/models/feeds.dart';
import 'package:instagram_clone/models/story.dart';

class HomeController extends GetxController {
  var storyObsList = List<UserStory>.empty(growable: true).obs;
  var feedsObsList = List<Feeds>.empty(growable: true).obs;
  var isFeedLiked = false.obs;

  void toggleLikedFeed(var id) {
    isFeedLiked.value = !isFeedLiked.value;
  }

  Future<List<UserStory>> getUserStories() async {
    List<UserStory> listStory = [];

    try {
      var _dummy1 = UserStory(
        username: 'chevalierlab',
        avatarURL: 'assets/images/chevalier.png',
      );
      var _dummy2 = UserStory(
        username: 'bmw_official',
        avatarURL: 'assets/images/bmw.png',
      );
      var _dummy3 = UserStory(
        username: 'account_x',
        avatarURL: 'assets/images/prism-a.png',
      );
      var _dummy4 = UserStory(
        username: 'google',
        avatarURL: 'assets/images/icon_google.png',
      );

      listStory.add(_dummy1);
      listStory.add(_dummy2);
      listStory.add(_dummy3);
      listStory.add(_dummy4);

      storyObsList.addAll(listStory);
    } catch (e) {
      print(e.toString());
    }

    return listStory;
  }

  Future<List<Feeds>> getFeeds() async {
    List<Feeds> listFeeds = [];

    try {
      var _dummy1 = Feeds(
        id: 1,
        username: 'chevalierlab',
        avatarURL: 'assets/images/icon_google.png',
        imageURL: 'https://daniszaidan.github.io/assets/project/Chevalier.jpg',
        likeCount: '500',
        isLiked: isFeedLiked.value,
        comments:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      );

      var _dummy2 = Feeds(
        id: 2,
        username: 'bmw_official',
        avatarURL: 'assets/images/bmw.png',
        imageURL:
            'https://www.bmw.co.id/content/dam/bmw/common/all-models/3-series/series-overview/bmw-3er-overview-page-ms-06.jpg/jcr:content/renditions/cq5dam.resized.img.890.medium.time1627455295591.jpg',
        likeCount: '510,688',
        isLiked: isFeedLiked.value,
        comments:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      );

      var _dummy3 = Feeds(
        id: 3,
        username: 'bmw_official',
        avatarURL: 'assets/images/bmw.png',
        imageURL:
            'https://www.bmw.co.id/content/dam/bmw/common/all-models/3-series/series-overview/bmw-3er-overview-page-cp-xxl.jpg/jcr:content/renditions/cq5dam.resized.img.980.medium.time1627455297346.jpg',
        likeCount: '3,560,501',
        isLiked: isFeedLiked.value,
        comments:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      );

      var _dummy4 = Feeds(
        id: 4,
        username: 'google',
        avatarURL: 'assets/images/icon_google.png',
        imageURL:
            'https://lh5.googleusercontent.com/p/AF1QipOWRpuyAmHjW2PKfu9H7ZhMIH08iY35SCddf4-0=w408-h306-k-no',
        likeCount: '104,555',
        isLiked: isFeedLiked.value,
        comments:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      );

      listFeeds.add(_dummy1);
      listFeeds.add(_dummy2);
      listFeeds.add(_dummy3);
      listFeeds.add(_dummy4);

      feedsObsList.addAll(listFeeds);
    } catch (e) {
      print(e.toString());
    }

    return listFeeds;
  }

  Future<List<Feeds>> setFeedsLike(var id) async {
    List<Feeds> listFeeds = [];

    try {
      getFeeds().then((value) {
        listFeeds.addAll(value);

        var count = int.parse(listFeeds[id - 1].likeCount) + 1;

        listFeeds[id - 1] = Feeds(
          id: listFeeds[id - 1].id,
          username: listFeeds[id - 1].username,
          avatarURL: listFeeds[id - 1].avatarURL,
          imageURL: listFeeds[id - 1].imageURL,
          likeCount: count.toString(),
          isLiked: !listFeeds[id - 1].isLiked,
          comments: listFeeds[id - 1].comments,
        );
        print(listFeeds[id - 1].isLiked);
      });
    } catch (e) {
      print(e.toString());
    }

    return listFeeds;
  }
}
