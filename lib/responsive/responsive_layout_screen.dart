import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/user_models.dart';
import '../utills/globle_variable.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;
  const ResponsiveLayout({
    Key key,
      this.mobileScreenLayout,
      this.webScreenLayout,
  }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    FavoriteProvider _userProvider =
    Provider.of<FavoriteProvider>(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        // 600 can be changed to 900 if you want to display tablet screen with mobile screen layout
        return widget.webScreenLayout;
      }
      return widget.mobileScreenLayout;
    });
  }
}
