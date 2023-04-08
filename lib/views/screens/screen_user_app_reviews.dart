import 'package:flutter/material.dart';
import '../layouts/layout_user_app_reviews.dart';

class ScreenUserAppReviews extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Reviews", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.black,),),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 12,
            itemBuilder: (BuildContext context, int index){
              return LayoutUserAppReviews();
            }),
      ),
    );
  }
}
