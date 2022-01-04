import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/controller/auth_controller.dart';
import 'package:instagram_clone/controller/binding/controller_binding.dart';
import 'package:instagram_clone/controller/home_controller.dart';
import 'package:instagram_clone/view/splash_screen.dart';

void main() {
  Get.put(HomeController(), permanent: true);
  Get.put(AuthController(), permanent: true);

  runApp(MyApp());
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
