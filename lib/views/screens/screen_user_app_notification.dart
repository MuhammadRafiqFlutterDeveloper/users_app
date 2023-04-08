import 'package:flutter/material.dart';
class ScreenUserAppNotification extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Notifications",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.40),
                  blurRadius: 4,
                ),
              ],
            ),
            child: ListTile(
              subtitle: RichText(text: TextSpan(
                text: "Give review about your experience at ", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff949494),),
                children: [
                  TextSpan(
                    text: "Grand Royle Hotel.", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff000000),),
                  )
                ]
              )),
              title: Text("Review",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black,),),
              trailing: Icon(Icons.mail_outline, color: Color(0xff2FB8A6), size: 18,),
              onTap: (){

              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.40),
                  blurRadius: 4,
                ),
              ],
            ),
            child: ListTile(
              subtitle: RichText(text: TextSpan(
                  text: "Give review about your experience at ", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff949494),),
                  children: [
                    TextSpan(
                      text: "Grand Royle Hotel.", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff000000),),
                    ),
                  TextSpan(
                      text: " at ", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff949494),),
                  ),
                    TextSpan(
                      text: "14 Dec, 2021.", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff000000),),
                    ),
                  ]
              )),
              title: Text("Review",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black,),),
              trailing: Icon(Icons.mail_outline, color: Color(0xff2FB8A6), size: 18,),
              onTap: (){

              },
            ),
          ),
        ],
      ),
    );
  }
}
