import 'package:flutter/material.dart';

import '../layouts/finneshed.dart';
import '../layouts/layout_user_app_favorites.dart';
import '../layouts/layout_user_app_upcomming.dart';

class ScreenUserAppTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          automaticallyImplyLeading: false,
          title: Text(
            "My Trips",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TabBar(
              indicator: BoxDecoration(
                color: Color(0xff2FB8A6),
                borderRadius: BorderRadius.circular(25),
              ),
              automaticIndicatorColorAdjustment: true,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  text: "Upcoming",
                ),
                Tab(
                  text: "Finished",
                ),
                Tab(text: "Favorites")
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  LayoutUserAppUpcomming(),
                  LayoutUserAppFinneshed(),
                  Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: LayoutUserAppFavorites()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
