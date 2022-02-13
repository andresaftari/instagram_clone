import 'package:instagram_clone/data/domain/client/profile_client.dart';

class ProfileRepository {
  final ProfileClient _profileClient = ProfileClient();

  Future getProfileFeeds() async {
    return _profileClient.getProfileFeeds();
  }

  Future getHighlight() async {
    return _profileClient.getHighlight();
  }
}