import 'package:flutter/material.dart';

class ScreenUserAppChangePassword extends StatelessWidget {

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
          "Change Password",
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
            alignment: Alignment.center,
            child: Image(
              image: AssetImage(
                "assets/picture/img_2.png",
              ),
            ),
          ),
          Container(
            height: 43,
            // height: MediaQuery.of(context).size.height/9,
            width: MediaQuery.of(context).size.width * 0.90,
            margin: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Old Password",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff7D7D7D),
                ),
              ),
            ),
          ),
          Container(
            height: 43,
            // height: MediaQuery.of(context).size.height/9,
            width: MediaQuery.of(context).size.width * 0.90,
            margin: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "New Password",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff7D7D7D),
                ),
              ),
            ),
          ),
          Container(
            height: 43,
            // height: MediaQuery.of(context).size.height/9,
            width: MediaQuery.of(context).size.width * 0.90,
            margin: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Confirm Password",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff7D7D7D),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.70,
            decoration: BoxDecoration(
                color: Color(0xff2FB8A6),
                borderRadius: BorderRadius.circular(25)),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "Send",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }
}
