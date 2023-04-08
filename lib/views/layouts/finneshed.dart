import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class LayoutUserAppFinneshed extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 210,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.40), blurRadius: 3,
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
                  image: AssetImage("assets/images1/rectangle08.png",),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Grand Royal Park Hotel",
                    style: GoogleFonts.getFont("Rufina",
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Text(
                    "\$ 220",
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
          ],
        ),
      ),
    );
  }
}
