import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users_app/helps/helper.dart';
import 'package:users_app/views/screens/screen_usr_app_hotels.dart';
import '../layouts/layout_user_app_catagorie.dart';
import '../layouts/layout_user_app_last_searches.dart';
import '../layouts/layout_user_app_popular.dart';

class ScreenUserAppNavigationBar extends StatefulWidget {
  @override
  State<ScreenUserAppNavigationBar> createState() =>
      _ScreenUserAppNavigationBarState();
}

class _ScreenUserAppNavigationBarState
    extends State<ScreenUserAppNavigationBar> {
  // int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // StreamBuilder<QuerySnapshot>(
                //     stream: FirebaseFirestore.instance
                //         .collection('Post')
                //         .snapshots(),
                //     builder: (BuildContext context,
                //         AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                //       if (!streamSnapshot.hasData) {
                //         return Center(
                //           child: Text(
                //             "No Data Found",
                //             style: TextStyle(
                //               fontSize: 20,
                //               color: Colors.black,
                //               fontWeight: FontWeight.w700,
                //             ),
                //           ),
                //         );
                //       } else if (streamSnapshot.connectionState ==
                //           ConnectionState.waiting) {
                //         return Center(
                //           child: CircularProgressIndicator(
                //             color: colors,
                //           ),
                //         );
                //       } else {
                //
                //       }
                //       return Center(
                //         child: Text(
                //           'No Image Found',
                //           style: TextStyle(
                //             fontSize: 14,
                //             fontWeight: FontWeight.w500,
                //             color: Colors.black,
                //           ),
                //         ),
                //       );
                //     }),
                CarouselSlider(
                  items: [
                    Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage('assets/hd/5.jfif'),
                          // image: NetworkImage(
                          //   streamSnapshot
                          //       .data.docs[index]['images']
                          //       .toString(),
                          // ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage('assets/hd/6.jfif'),
                          // image: NetworkImage(
                          //   streamSnapshot
                          //       .data.docs[index]['images']
                          //       .toString(),
                          // ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // ListView.builder(
                    //   itemCount: streamSnapshot.data.docs.length,
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return
                    //   },
                    // ),
                  ],
                  options: CarouselOptions(
                    height: 380.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 1000),
                    viewportFraction: 1,
                    reverse: true,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        // minimumSize: Size(200, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        openScreen(context, ScreenUsrAppHotels());
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: colors,
                          ),
                          Text(
                            "Where are you going?",
                            style: textfield,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 100,
                  left: 20,
                  child: Text(
                    "Cape Town",
                    style: GoogleFonts.getFont(
                      "Rufina",
                      fontSize: 33,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 80,
                    left: 20,
                    child: Text(
                      "outdoor activities",
                      style: GoogleFonts.getFont(
                        "Rufina",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    )),
                Positioned(
                  bottom: 30,
                  left: 20,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(130, 30),
                      backgroundColor: Color(0xff2FB8A6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {
                      openScreen(context, ScreenUsrAppHotels());
                    },
                    child: Text(
                      "View Hotels",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "Last Searches",
                style: genral,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 180,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return LayoutUserAppLastSearches();
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 10, top: 0),
              child: Text(
                "Popular Destinations",
                style: genral,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 130,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return LayoutUserAppPopular();
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 10, top: 0),
              child: Text(
                "Categories",
                style: genral,
              ),
            ),
            Container(
              height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return LayoutUserAppCatagorie();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
