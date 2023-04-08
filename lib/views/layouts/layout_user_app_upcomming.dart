import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users_app/views/layouts/layout_user_app_map.dart';

import '../../helper/helps.dart';

class LayoutUserAppUpcomming extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('upcoming').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text(
                  "No Data Found",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: colors,
                ),
              );
            } else {
              ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 210,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.40),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 130,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                snapshot.data.docs[index]['images'].toString(),
                              ),
                              fit: BoxFit.fill,
                            ),
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
                                snapshot.data.docs[index]['name'].toString(),
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
                              child: Text(
                                snapshot.data.docs[index]['price'].toString(),
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
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 0),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.location_on,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      Get.to(LayoutUserAppGoogleMap());
                                    },
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
                      ],
                    ),
                  );
                },
              );
            }
            return Center(
              child: Text(
                'No Data Found',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            );
          }),
    );
  }
}
