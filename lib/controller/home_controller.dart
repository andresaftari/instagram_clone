import 'package:get/get.dart';
import 'package:instagram_clone/models/feeds.dart';
import 'package:instagram_clone/models/story.dart';

class HomeController extends GetxController {
  var storyObsList = List<UserStory>.empty(growable: true).obs;
  var feedsObsList = List<Feeds>.empty(growable: true).obs;

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
        username: 'chevalierlab',
        avatarURL: 'assets/images/icon_google.png',
        imageURL: 'https://daniszaidan.github.io/assets/project/Chevalier.jpg',
        likeCount: '500',
      );

      var _dummy2 = Feeds(
        username: 'bmw_official',
        avatarURL: 'assets/images/bmw.png',
        imageURL: 'https://www.bmw.co.id/content/dam/bmw/common/all-models/3-series/series-overview/bmw-3er-overview-page-ms-06.jpg/jcr:content/renditions/cq5dam.resized.img.890.medium.time1627455295591.jpg',
        likeCount: '20K',
      );

      var _dummy3 = Feeds(
        username: 'bmw_official',
        avatarURL: 'assets/images/bmw.png',
        imageURL: 'https://www.bmw.co.id/content/dam/bmw/common/all-models/3-series/series-overview/bmw-3er-overview-page-cp-xxl.jpg/jcr:content/renditions/cq5dam.resized.img.980.medium.time1627455297346.jpg',
        likeCount: '3,5K',
      );

      var _dummy4 = Feeds(
        username: 'google',
        avatarURL: 'assets/images/icon_google.png',
        imageURL: 'https://lh5.googleusercontent.com/p/AF1QipOWRpuyAmHjW2PKfu9H7ZhMIH08iY35SCddf4-0=w408-h306-k-no',
        likeCount: '104K',
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
}
