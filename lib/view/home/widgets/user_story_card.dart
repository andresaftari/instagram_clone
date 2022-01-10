import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_clone/themes/theme_color.dart';

class UserStoryCard extends StatelessWidget {
  final String? username, avatarURL;

  const UserStoryCard({
    Key? key,
    required this.username,
    required this.avatarURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Color.fromRGBO(248, 7, 89, 1),
              width: 1.8,
            ),
            image: DecorationImage(
              image: AssetImage(
                avatarURL ?? 'assets/images/noavatar.png',
              ),
              fit: BoxFit.contain,
            ),
          ),
          width: 62,
          height: 62,
        ),
        Text(
          username.toString(),
          style: TextStyle(
            fontSize: 11,
            color: bgLightMode,
          ),
        ),
      ],
    );
  }
}

class CurrentStoryCard extends StatelessWidget {
  final String? username, avatarURL;

  const CurrentStoryCard({
    Key? key,
    required this.username,
    required this.avatarURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color.fromRGBO(61, 235, 52, 1),
                  width: 1.8,
                ),
                image: DecorationImage(
                  image: AssetImage(
                    avatarURL ?? 'assets/images/noavatar.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
              width: 62,
              height: 62,
              child: Align(
                alignment: AlignmentDirectional(1, 1),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Color(0xFFFBFBFB),
                    size: 24,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(
              username.toString(),
              style: TextStyle(
                fontSize: 11,
                color: bgLightMode,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
