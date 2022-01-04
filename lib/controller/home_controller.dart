import 'package:get/get.dart';
import 'package:instagram_clone/models/story.dart';

class HomeController extends GetxController {
  var storyObsList = List<UserStory>.empty(growable: true).obs;

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
}
