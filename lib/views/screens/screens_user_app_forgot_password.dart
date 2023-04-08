import 'package:flutter/material.dart';
import 'package:users_app/helps/helper.dart';

class ScreensUserAppForgotPassword extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: TextButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18,)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "Forgot Password",
                style: genral,
              ),
            ),
            SizedBox(height: 20,),
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 20),
                child: Text("Enter your Email to recover your Account", style: gen,),),
            SizedBox(height: 100,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 40,
              width: MediaQuery.of(context).size.width*0.80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(23)
                ),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 3.0,
                      color: Colors.grey
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 25),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none
                    ),
                    hintText: 'Email', hintStyle: textfield,
                ),
              ),
            ),
            SizedBox(height: 100,),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width*0.80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff2FB8A6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                onPressed: () {},
                child: Text(
                  "Send",
                  style: button,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
