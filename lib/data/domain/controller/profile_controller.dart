import 'package:get/get.dart';
import 'package:instagram_clone/data/domain/repository/profile_repository.dart';
import 'package:instagram_clone/models/feeds.dart';

class ProfileController extends GetxController {
  final ProfileRepository _profileRepository = ProfileRepository();

  var feedsObsList = List<ProfileFeeds>.empty(growable: true).obs;
  var highlightsObsList = List<ProfileHighlights>.empty(growable: true).obs;

  Future getProfileFeeds() async {
    return _profileRepository.getProfileFeeds().then((value) {
      print('ProfileFeeds: Controller Passed');

      feedsObsList.assignAll(value);
      return value;
    });
  }

  Future getHighlight() async {
    return _profileRepository.getHighlight().then((value) {
      print('Highlights: Controller Passed');

      highlightsObsList.assignAll(value);
      return value;
    });
  }
}
