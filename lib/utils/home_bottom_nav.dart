import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/snackbar_util.dart';
import 'package:instagram_clone/view/pages.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomNavViews extends StatefulWidget {
  final PersistentTabController? controller;

  const BottomNavViews({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  _BottomNavViewsState createState() => _BottomNavViewsState();
}

class _BottomNavViewsState extends State<BottomNavViews> {
  late PersistentTabController? _controller;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _controller = widget.controller;
    super.initState();
  }

  List<Widget> _pageViews() => [
        HomePageViews(),
        DiscoveryPageViews(),
        // Discovery
        Container(),
        // Reels
        Container(),
        // Shopping
        ProfilePageViews(
          username: 'andresaftari',
          fullname: 'Andre Saftari',
          avatarUrl: 'assets/images/andre.png',
        ),
        // Account
      ];

  List<PersistentBottomNavBarItem> _bottomNavItems() => [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home_filled),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white.withOpacity(0.5),
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.search),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white.withOpacity(0.5),
        ),
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.play_rectangle_fill),
          inactiveIcon: Icon(CupertinoIcons.play_rectangle),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white.withOpacity(0.5),
        ),
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.bag_fill),
          inactiveIcon: Icon(CupertinoIcons.bag),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white.withOpacity(0.5),
        ),
        PersistentBottomNavBarItem(
          icon: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/andre.png'),
              ),
            ),
          ),
        ),
      ];

  void _scrollToTop() => _scrollController.animateTo(
        0,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _pageViews(),
        items: _bottomNavItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.black,
        navBarStyle: NavBarStyle.style6,
        onItemSelected: (index) async {
          switch (index) {
            case 2:
            case 3:
              SnackbarUtils.showDebug(
                'Masih dalam pengembangan',
                'Bottom Navigation',
                'Utility',
              );
              break;
          }
        },
      ),
    );
  }
}
