import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:users_app/helps/helper.dart';
import 'package:users_app/views/screens/screen_user_app_my_profile.dart';
import 'package:users_app/views/screens/screen_user_app_navigation_bar.dart';
import 'package:users_app/views/screens/screen_user_app_tab_bar.dart';
class ScreenUserAppNavigation extends StatefulWidget {

  @override
  State<ScreenUserAppNavigation> createState() =>
      _ScreenUserAppNavigationState();
}

class _ScreenUserAppNavigationState extends State<ScreenUserAppNavigation> {
  int _page = 0;
  final screens = [
    ScreenUserAppNavigationBar(),
    ScreenUserAppTabBar(),
    ScreenUserAppMyProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CurvedNavigationBar(
          color: colors,
          index: 0,
          height: 40.0,
          items: <Widget>[
            Icon(Icons.home, color: Colors.white, size: 30),
            Icon(Icons.commute, color: Colors.white, size: 30),
            Icon(Icons.supervised_user_circle, color: Colors.white, size: 30),
          ],
          buttonBackgroundColor: colors,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: screens[_page]);
  }
}
