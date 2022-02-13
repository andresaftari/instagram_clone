import 'package:get/get.dart';
import 'package:instagram_clone/data/domain/repository/discovery_repository.dart';
import 'package:instagram_clone/models/discovery.dart';

class DiscoveryController extends GetxController {
  final DiscoveryRepository _discoveryRepository = DiscoveryRepository();

  var discoveryObsList = List<Discovery>.empty(growable: true).obs;

  Future<List<Discovery>> getDiscoveryFeeds() async {
    return _discoveryRepository.getDiscoveryFeeds().then((value) {
      // print('Discovery: Controller Passed');

      discoveryObsList.assignAll(value);
      return value;
    });
  }
}