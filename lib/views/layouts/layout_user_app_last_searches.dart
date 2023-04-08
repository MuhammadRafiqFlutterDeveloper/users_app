import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users_app/helps/helper.dart';

class LayoutUserAppLastSearches extends StatefulWidget {

  @override
  State<LayoutUserAppLastSearches> createState() => _LayoutUserAppLastSearchesState();
}

class _LayoutUserAppLastSearchesState extends State<LayoutUserAppLastSearches> {
  double _rating = 0;
  @override
  Widget build(BuildContext context) {

    return Container(
      width: 110,
      height: 140,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.50),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
              height: 100,
              width: 130,
              child: Image.asset(
                "assets/hd/4.jfif",
                fit: BoxFit.fill,
              )),
          Row(
            children: [
              Text(
                "London",
                style: GoogleFonts.getFont(
                  "Roboto",
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "3km",
                style: gen,
              ),
            ],
          ),
          SizedBox(height: 10,),
          Text(
            "Restaurants Name",
            style: gen,
          ),
          SizedBox(height: 10,),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerRight,
            child: RatingBar.builder(
              maxRating: 1,
              itemSize: 15,
              itemBuilder: (context,_)=>Icon( Icons.star,
                  color: Colors.amber),
              onRatingUpdate: (_rating){
                setState(() {
                  this._rating = _rating;
                });
              },),

          ),
        ],
      ),
    );
  }
}
