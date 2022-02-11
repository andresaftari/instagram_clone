import 'package:instagram_clone/data/domain/client/discovery_client.dart';
import 'package:instagram_clone/models/discovery.dart';

class DiscoveryRepository {
  final DiscoveryClient _discoveryClient = DiscoveryClient();

  Future<List<Discovery>> getDiscoveryFeeds() async {
    return _discoveryClient.getDiscoveryFeeds();
  }
}
