import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/data/binding/controller_binding.dart';
import 'package:instagram_clone/data/domain/controller/auth_controller.dart';
import 'package:instagram_clone/data/domain/controller/discovery_controller.dart';
import 'package:instagram_clone/data/domain/controller/home_controller.dart';
import 'package:instagram_clone/data/domain/controller/profile_controller.dart';
import 'package:instagram_clone/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(HomeController(), permanent: true);
  Get.put(AuthController(), permanent: true);
  Get.put(ProfileController(), permanent: true);
  Get.put(DiscoveryController(), permanent: true);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinding(),
      theme: ThemeData(fontFamily: 'Proxima Nova'),
      darkTheme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}
