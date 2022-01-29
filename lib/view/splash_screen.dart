import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/utils/home_bottom_nav.dart';
import 'package:instagram_clone/view/pages.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
          () => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, a, b) => const BottomNavViews(),
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, anim, a, child) =>
              FadeTransition(opacity: anim, child: child),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 26, 26, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Center(
            child: Image(
              image: AssetImage('assets/images/logo_ig.png'),
              width: 80,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 24),
            child: Column(
              children: [
                Text(
                  'from',
                  style: TextStyle(color: Color.fromRGBO(85, 99, 109, 1)),
                ),
                Image(
                  image: AssetImage('assets/images/logo_meta.png'),
                  width: 90,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
