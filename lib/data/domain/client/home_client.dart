import 'package:get/get.dart';
import 'package:instagram_clone/models/feeds.dart';
import 'package:instagram_clone/models/story.dart';

class HomeClient {
  var isFeedLiked = false.obs;

  void toggleLikedFeed(var id) {
    isFeedLiked.value = !isFeedLiked.value;
  }

  Future getUserStories() async {
    List<UserStory> listStory = [];

    try {
      var init = UserStory(
        username: '',
        avatarURL: '',
      );
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
      var _dummy5 = UserStory(
        username: 'Telkom University',
        avatarURL: 'assets/images/telkom_logo.png',
      );

      listStory.add(init);
      listStory.add(_dummy1);
      listStory.add(_dummy2);
      listStory.add(_dummy3);
      listStory.add(_dummy4);
      listStory.add(_dummy5);
    } catch (e) {
      print(e.toString());
    }

    return listStory;
  }

  Future<List<Feeds>> getFeeds() async {
    List<Feeds> listFeeds = [];

    try {
      var _init = Feeds(
        id: 0,
        username: '',
        avatarURL: '',
        imageURL: '',
        likeCount: '',
        isLiked: false,
        captions: '',
        commentBy: '',
        comments: '',
        commentCount: 0,
        createdAt: 0,
      );

      var _dummy1 = Feeds(
        id: 1,
        username: 'chevalierlab',
        avatarURL: 'assets/images/chevalier.png',
        imageURL: 'https://daniszaidan.github.io/assets/project/Chevalier.jpg',
        likeCount: '500',
        isLiked: isFeedLiked.value,
        captions:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        commentBy: 'andresaftari',
        comments: 'Test 1st Comment',
        commentCount: 4,
        createdAt: 2,
      );

      var _dummy2 = Feeds(
          id: 2,
          username: 'bmw_official',
          avatarURL: 'assets/images/bmw.png',
          imageURL:
              'https://www.bmw.co.id/content/dam/bmw/common/all-models/3-series/series-overview/bmw-3er-overview-page-ms-06.jpg/jcr:content/renditions/cq5dam.resized.img.890.medium.time1627455295591.jpg',
          likeCount: '510688',
          isLiked: isFeedLiked.value,
          captions:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          commentBy: '',
          comments: '',
          commentCount: 0,
          createdAt: 4);

      var _dummy3 = Feeds(
        id: 3,
        username: 'bmw_official',
        avatarURL: 'assets/images/bmw.png',
        imageURL:
            'https://www.bmw.co.id/content/dam/bmw/common/all-models/3-series/series-overview/bmw-3er-overview-page-cp-xxl.jpg/jcr:content/renditions/cq5dam.resized.img.980.medium.time1627455297346.jpg',
        likeCount: '3560501',
        isLiked: isFeedLiked.value,
        captions:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        commentBy: 'sukrirachmad',
        comments: 'Test 2nd Comment',
        commentCount: 5,
        createdAt: 14,
      );

      var _dummy4 = Feeds(
        id: 4,
        username: 'google',
        avatarURL: 'assets/images/icon_google.png',
        imageURL:
            'https://lh5.googleusercontent.com/p/AF1QipOWRpuyAmHjW2PKfu9H7ZhMIH08iY35SCddf4-0=w408-h306-k-no',
        likeCount: '104555',
        isLiked: isFeedLiked.value,
        captions:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        commentBy: '',
        comments: '',
        commentCount: 0,
        createdAt: 8,
      );

      listFeeds.add(_init);
      listFeeds.add(_dummy1);
      listFeeds.add(_dummy2);
      listFeeds.add(_dummy3);
      listFeeds.add(_dummy4);

    } catch (e) {
      print(e.toString());
    }

    return listFeeds;
  }
}
