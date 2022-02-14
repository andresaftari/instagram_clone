import 'package:instagram_clone/models/reels.dart';

class ReelsClient {
  Future getReels() async {
    List<Reels> listReels = [];

    try {
      var _dummy1 = Reels(
        id: 1,
        username: '',
        avatarUrl: '',
        contentUrl: '',
        caption: '',
        audioname: '',
        filtername: '',
      );

      var _dummy2 = Reels(
        id: 2,
        username: '',
        avatarUrl: '',
        contentUrl: '',
        caption: '',
        audioname: '',
        filtername: '',
      );

      var _dummy3 = Reels(
        id: 3,
        username: '',
        avatarUrl: '',
        contentUrl: '',
        caption: '',
        audioname: '',
        filtername: '',
      );

      listReels.add(_dummy1);
      listReels.add(_dummy2);
      listReels.add(_dummy3);
    } catch (e) {
      print(e.toString());
    }

    return listReels;
  }
}
