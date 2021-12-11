import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
