import 'package:instagram_clone/models/feeds.dart';

class ProfileClient {
  Future getProfileFeeds() async {
    List<ProfileFeeds> listProfileFeeds = [];

    try {
      var _dummy1 = ProfileFeeds(
        id: 1,
        imageURL: '',
        isPhoto: true,
        isVideo: false,
        isReels: false,
        isIGTV: false,
        isSlideshows: false,
      );

      var _dummy2 = ProfileFeeds(
        id: 2,
        imageURL: '',
        isPhoto: false,
        isVideo: true,
        isReels: true,
        isIGTV: false,
        isSlideshows: false,
      );

      var _dummy3 = ProfileFeeds(
        id: 3,
        imageURL: '',
        isPhoto: false,
        isVideo: true,
        isReels: false,
        isIGTV: true,
        isSlideshows: false,
      );

      var _dummy4 = ProfileFeeds(
        id: 4,
        imageURL: '',
        isPhoto: true,
        isVideo: false,
        isReels: false,
        isIGTV: false,
        isSlideshows: true,
      );

      listProfileFeeds.add(_dummy1);
      listProfileFeeds.add(_dummy2);
      listProfileFeeds.add(_dummy3);
      listProfileFeeds.add(_dummy4);
    } catch (e) {
      print(e.toString());
    }

    return listProfileFeeds;
  }

  Future getHighlight() async {
    List<ProfileHighlights> listProfileHighlights = [];

    try {
      var _dummy1 = ProfileHighlights(
        id: 1,
        thumbnail: 'assets/images/chevalier.png',
        title: 'Welcome',
      );

      var _dummy2 = ProfileHighlights(
        id: 2,
        thumbnail: 'assets/images/andre.png',
        title: 'To',
      );

      var _dummy3 = ProfileHighlights(
        id: 3,
        thumbnail: 'assets/images/prism-a.png',
        title: 'Andzzz\'s',
      );

      listProfileHighlights.add(_dummy1);
      listProfileHighlights.add(_dummy2);
      listProfileHighlights.add(_dummy3);
    } catch (e) {
      print(e.toString());
    }

    return listProfileHighlights;
  }
}
