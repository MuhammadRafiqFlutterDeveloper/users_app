import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:users_app/helps/helper.dart';
import '../../provider/user_models.dart';
import '../screens/screen_user_app_booking_details.dart';

class LayoutUserAppFavorites extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final words = provider.words;
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4), blurRadius: 3,
          )
        ]
      ),
      child: ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          final word = words[index];
          return ListTile(
            leading: Image.asset(word,width: 90, height: 80,fit: BoxFit.fill,),
            title: Text("Grand Royle Hotel", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black,),),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Location Name", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff989898),),)),
                SizedBox(height: 8,),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text("2 miles away", style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400, color: Colors.black,),)),
                Container(
                  alignment: Alignment.centerLeft,
                  child: RatingBarIndicator(
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

              ],
            ),
            trailing: Column(
              children: [
                Text("\$ 220", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xff2FB8A6),),),
                Text("per night", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xff989898),),),

              ],
            ),
            onTap: (){
              openScreen(context, ScreenUserAppBookingDetails());
            },
          );
        },
      ),

    );
  }
}
