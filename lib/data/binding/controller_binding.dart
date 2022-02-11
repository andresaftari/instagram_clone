import 'package:get/get.dart';
import 'package:instagram_clone/data/domain/controller/auth_controller.dart';
import 'package:instagram_clone/data/domain/controller/home_controller.dart';
import 'package:instagram_clone/data/domain/controller/profile_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    Get.put(ProfileController(), permanent: true);
  }
}