import 'package:instagram_clone/models/discovery.dart';

class DiscoveryClient {
  Future<List<Discovery>> getDiscoveryFeeds() async {
    List<Discovery> discoveryList = [];

    try {
      var _dummy1 = Discovery(
        id: 1,
        contentUrl: 'https://media.npr.org/assets/img/2021/08/11/gettyimages-1279899488_wide-f3860ceb0ef19643c335cb34df3fa1de166e2761-s1100-c50.jpg',
        isPhoto: false,
        isReels: true,
        isSlideshows: false,
      );
      var _dummy2 = Discovery(
        id: 2,
        contentUrl: 'https://media.npr.org/assets/img/2021/08/11/gettyimages-1279899488_wide-f3860ceb0ef19643c335cb34df3fa1de166e2761-s1100-c50.jpg',
        isPhoto: true,
        isReels: false,
        isSlideshows: false,
      );
      var _dummy3 = Discovery(
        id: 3,
        contentUrl: 'https://media.npr.org/assets/img/2021/08/11/gettyimages-1279899488_wide-f3860ceb0ef19643c335cb34df3fa1de166e2761-s1100-c50.jpg',
        isPhoto: true,
        isReels: false,
        isSlideshows: false,
      );
      var _dummy4 = Discovery(
        id: 4,
        contentUrl: 'https://media.npr.org/assets/img/2021/08/11/gettyimages-1279899488_wide-f3860ceb0ef19643c335cb34df3fa1de166e2761-s1100-c50.jpg',
        isPhoto: true,
        isReels: false,
        isSlideshows: true,
      );
      var _dummy5 = Discovery(
        id: 5,
        contentUrl: 'https://media.npr.org/assets/img/2021/08/11/gettyimages-1279899488_wide-f3860ceb0ef19643c335cb34df3fa1de166e2761-s1100-c50.jpg',
        isPhoto: false,
        isReels: true,
        isSlideshows: false,
      );
      var _dummy6 = Discovery(
        id: 6,
        contentUrl: 'https://media.npr.org/assets/img/2021/08/11/gettyimages-1279899488_wide-f3860ceb0ef19643c335cb34df3fa1de166e2761-s1100-c50.jpg',
        isPhoto: true,
        isReels: false,
        isSlideshows: true,
      );
      var _dummy7 = Discovery(
        id: 7,
        contentUrl: 'https://media.npr.org/assets/img/2021/08/11/gettyimages-1279899488_wide-f3860ceb0ef19643c335cb34df3fa1de166e2761-s1100-c50.jpg',
        isPhoto: true,
        isReels: false,
        isSlideshows: false,
      );

      discoveryList.add(_dummy1);
      discoveryList.add(_dummy2);
      discoveryList.add(_dummy3);
      discoveryList.add(_dummy4);
      discoveryList.add(_dummy5);
      discoveryList.add(_dummy6);
      discoveryList.add(_dummy7);
    } catch (e) {
      print(e.toString());
    }

    return discoveryList;
  }
}
