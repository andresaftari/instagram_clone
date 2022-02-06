import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/themes/theme_color.dart';

class ProfileAppbar extends StatefulWidget implements PreferredSizeWidget {
  final String username;

  const ProfileAppbar({Key? key, required this.username}) : super(key: key);

  @override
  _ProfileAppbarState createState() => _ProfileAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class _ProfileAppbarState extends State<ProfileAppbar> {
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      elevation: 0.12,
      backgroundColor: bgDarkMode,
      shadowColor: bgLightMode,
      title: Text('${widget.username}'),
      automaticallyImplyLeading: false,
      actions: [
        actionAddPost(),
        actionMoreProfile(),
      ],
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

  IconButton actionMoreProfile() {
    return IconButton(
      onPressed: () => Get.snackbar(
        'More Profile',
        'Masih dalam pengembangan',
        duration: Duration(seconds: 2),
      ),
      icon: Icon(
        Icons.menu,
        color: bgLightMode,
        size: 28,
      ),
    );
  }
}
