import 'package:get/get.dart';
import 'package:instagram_clone/controller/auth_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
  }
}