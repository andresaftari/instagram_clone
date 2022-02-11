import 'package:instagram_clone/models/discovery.dart';

class DiscoveryClient {
  Future<List<Discovery>> getDiscoveryFeeds() async {
    List<Discovery> discoveryList = [];

    try {
      var _dummy1 = Discovery(
        id: 1,
        contentUrl: 'h',
        isPhoto: true,
        isReels: false,
        isSlideshows: true,
      );
      var _dummy2 = Discovery(
        id: 2,
        contentUrl: 'h',
        isPhoto: true,
        isReels: false,
        isSlideshows: true,
      );
      var _dummy3 = Discovery(
        id: 3,
        contentUrl: 'h',
        isPhoto: true,
        isReels: false,
        isSlideshows: true,
      );
      var _dummy4 = Discovery(
        id: 4,
        contentUrl: 'h',
        isPhoto: true,
        isReels: false,
        isSlideshows: true,
      );

      discoveryList.add(_dummy1);
      discoveryList.add(_dummy2);
      discoveryList.add(_dummy3);
      discoveryList.add(_dummy4);
    } catch (e) {
      print(e.toString());
    }

    return discoveryList;
  }
}
