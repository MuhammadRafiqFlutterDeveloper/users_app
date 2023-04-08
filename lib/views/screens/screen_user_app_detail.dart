import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:users_app/helps/helper.dart';
import 'package:users_app/views/screens/screen_user_app_photos.dart';
import 'package:users_app/views/screens/screen_user_app_reviews.dart';
import '../layouts/layout_user_app_reviews.dart';
import '../layouts/layouts_user_app_images.dart';

class ScreenUserAppDetail extends StatefulWidget {
  @override
  State<ScreenUserAppDetail> createState() => _ScreenUserAppDetailState();
}

class _ScreenUserAppDetailState extends State<ScreenUserAppDetail>
    with SingleTickerProviderStateMixin {
  final CameraPosition _initialposition =
      CameraPosition(target: LatLng(24.903623, 67.198367));
  final List<Marker> markers = [];

   TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/detail.png",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Grand Royal Park Hotel",
                    style: GoogleFonts.getFont(
                      "Rufina",
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: TabBar(
                                indicator: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.black,
                                controller: _tabController,
                                tabs: [
                                  Tab(
                                    text: "hello",
                                  ),
                                  Tab(
                                    text: "hello",
                                  ),
                                ]),
                            actions: [
                              TableCalendar(
                                firstDay: DateTime.utc(2010, 10, 20),
                                lastDay: DateTime.utc(2040, 10, 20),
                                focusedDay: DateTime.now(),
                                headerVisible: true,
                                daysOfWeekVisible: true,
                                sixWeekMonthsEnforced: true,
                                shouldFillViewport: false,
                                headerStyle: HeaderStyle(
                                    titleTextStyle: TextStyle(
                                        fontSize: 12,
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.w600)),
                                calendarStyle: CalendarStyle(
                                    todayTextStyle: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      "\$ 220",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 0),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "Location name ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                      Icon(
                        Icons.location_on,
                        color: Colors.black,
                      ),
                      Text(
                        " 2 miles away ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 20),
                  child: Text(
                    "per night",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              endIndent: 20,
              indent: 20,
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Rooms",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      '21',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff2FB8A6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              endIndent: 20,
              indent: 20,
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Summary",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  '''Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia.''',
                  style: TextStyle(
                    color: Color(0xff414141),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                )),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 170,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.50),
                      blurRadius: 5,
                      spreadRadius: 0)
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Text(
                      "4.2",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff2FB8A6),
                      ),
                    ),
                    title: Text(
                      "Overall Rating",
                      style: GoogleFonts.getFont(
                        "Oswald",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff181818),
                      ),
                    ),
                    subtitle: RatingBarIndicator(
                      rating: 4,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 10.0,
                      direction: Axis.horizontal,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Place",
                        style: GoogleFonts.getFont(
                          "Oswald",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff181818),
                        ),
                      ),
                      LinearPercentIndicator(
                        width: 250.0,
                        lineHeight: 4,
                        percent: 0.75,
                        backgroundColor: Color(0xffDFDFDF),
                        progressColor: Color(0xff2FB8A6),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Service",
                        style: GoogleFonts.getFont(
                          "Oswald",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff181818),
                        ),
                      ),
                      LinearPercentIndicator(
                        width: 250.0,
                        lineHeight: 4,
                        percent: 0.8,
                        backgroundColor: Color(0xffDFDFDF),
                        progressColor: Color(0xff2FB8A6),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Price",
                        style: GoogleFonts.getFont(
                          "Oswald",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff181818),
                        ),
                      ),
                      LinearPercentIndicator(
                        width: 250.0,
                        lineHeight: 4,
                        percent: 0.5,
                        backgroundColor: Color(0xffDFDFDF),
                        progressColor: Color(0xff2FB8A6),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Quality",
                        style: GoogleFonts.getFont(
                          "Oswald",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff181818),
                        ),
                      ),
                      LinearPercentIndicator(
                        width: 250.0,
                        lineHeight: 4,
                        percent: 0.9,
                        backgroundColor: Color(0xffDFDFDF),
                        progressColor: Color(0xff2FB8A6),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    '''Photos''',
                    style: GoogleFonts.getFont(
                      "Oswald",
                      color: Color(0xff000000),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                      onTap: () {
                        openScreen(context, ScreenUserAppPhotos());
                      },
                      child: Text(
                        '''View all''',
                        style: GoogleFonts.getFont(
                          "Oswald",
                          color: Color(0xff2FB8A6),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return LayoutsUserAppImages();
                  }),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    '''Reviews''',
                    style: GoogleFonts.getFont(
                      "Oswald",
                      color: Color(0xff000000),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: TextButton(
                      onPressed: () {
                        openScreen(context, ScreenUserAppReviews());
                      },
                      child: Text(
                        '''View all''',
                        style: GoogleFonts.getFont(
                          "Oswald",
                          color: Color(0xff2FB8A6),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                ),
              ],
            ),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return LayoutUserAppReviews();
                  }),
            ),
            Container(
              margin: EdgeInsets.all(20),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: GoogleMap(
                initialCameraPosition: _initialposition,
                mapType: MapType.normal,
                onMapCreated: (controller) {
                  setState(() {});
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  minimumSize: Size(264, 40),
                  backgroundColor: Color(0xff2FB8A6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Image.asset(
                        "assets/images1/alert.png",
                        height: 70,
                        width: 100,
                      ),
                      content: Text(
                        "Congratulations!",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff2FB8A6)),
                      ),
                      actions: [
                        Column(
                          children: [
                            Container(
                                margin: EdgeInsets.all(20),
                                child: Text(
                                  "Your booking request has been sent when your request confirmed you will be notified.",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                )),
                            TextButton(
                              style: TextButton.styleFrom(
                                  minimumSize: Size(260, 40),
                                  backgroundColor: Color(0xff2FB8A6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  )),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Done",
                                  style: GoogleFonts.getFont(
                                    "Roboto",
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      ],
                    );
                  },
                );
              },
              child: Text("Book Now",
                  style: GoogleFonts.getFont(
                    "Roboto",
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
