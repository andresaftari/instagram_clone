import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/themes/theme_color.dart';

class HomeAppbar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _HomeAppbarState createState() => _HomeAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(60);
}

class _HomeAppbarState extends State<HomeAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.15,
      backgroundColor: bgDarkMode,
      shadowColor: bgLightMode,
      title: Text('Instaclone'),
      titleTextStyle: GoogleFonts.grandHotel(
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontSize: 36,
      ),
      actions: [
        actionAddPost(),
        actionActivity(),
        actionMessenger(),
      ],
      automaticallyImplyLeading: false,
    );
  }

  ElevatedButton actionMessenger() {
    return ElevatedButton(
      onPressed: () => Get.snackbar(
        'DM',
        'Masih dalam pengembangan',
        duration: Duration(seconds: 2),
      ),
      child: Image(
        image: AssetImage(
          'assets/images/fb_messenger.png',
        ),
        color: bgLightMode,
        filterQuality: FilterQuality.high,
        fit: BoxFit.cover,
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        onPrimary: Colors.transparent,
      ),
    );
  }

  IconButton actionActivity() {
    return IconButton(
      onPressed: () => Get.snackbar(
        'Activity',
        'Masih dalam pengembangan',
        duration: Duration(seconds: 2),
      ),
      icon: Icon(
        Icons.favorite_border_sharp,
        color: bgLightMode,
        size: 28,
      ),
    );
  }

  IconButton actionAddPost() {
    return IconButton(
      onPressed: () => Get.snackbar(
        'Add Post',
        'Masih dalam pengembangan',
        duration: Duration(seconds: 2),
      ),
      icon: Icon(
        Icons.add_box_outlined,
        color: bgLightMode,
        size: 28,
      ),
    );
  }
}
