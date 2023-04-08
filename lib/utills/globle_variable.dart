import 'package:flutter/material.dart';
import 'package:users_app/views/screens/screen_user_app_my_profile.dart';
import 'package:users_app/views/screens/screen_user_app_navigation_bar.dart';
import '../views/screens/screen_user_app_tab_bar.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  ScreenUserAppNavigationBar(),
  ScreenUserAppTabBar(),
  ScreenUserAppMyProfile(),
];
