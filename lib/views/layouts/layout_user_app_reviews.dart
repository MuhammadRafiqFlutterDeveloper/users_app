import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
class LayoutUserAppReviews extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListTile(
            leading: Image.asset("assets/images1/img_1.png"),
            title: Text("Alex Jack", style: GoogleFonts.getFont("Roboto", fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black,),),
            subtitle: Text("21 June, 2021 02:05 PM", style: GoogleFonts.getFont("Roboto", fontSize: 8, fontWeight: FontWeight.w400, color: Color(0xff999999),),),
            trailing: RatingBarIndicator(
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
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text('''Review text popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature''', style: GoogleFonts.getFont("Roboto", fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff414141),),)),
      ],
    );
  }
}
