import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:users_app/helps/helper.dart';
import 'package:users_app/views/screens/screen_user_app_change_password.dart';
import 'package:users_app/views/screens/screen_user_app_rating.dart';
import 'package:users_app/views/screens/screens_user_app_login.dart';
class ScreenUserAppSetting extends StatefulWidget {

  @override
  State<ScreenUserAppSetting> createState() => _ScreenUserAppSettingState();
}

class _ScreenUserAppSettingState extends State<ScreenUserAppSetting> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> signOut() async {
    await _auth.signOut();
  }
  bool notification = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Settings",
          style: appbar,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SwitchListTile(
              secondary: Icon(Icons.notifications,color: Color(0xff2FB8A6)),
              value: notification,
              title: Text(
                "Notification",
                style:genr,
              ),
              onChanged: (value) {
                setState(() {
                  notification = value;
                });
              },
              tileColor: Colors.white,
              activeColor: Colors.green,
              controlAffinity: ListTileControlAffinity.trailing,
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
              leading: Image.asset("assets/picture/img_1.png"),
              title: Text("Give Rating",style: genr,),
              onTap: (){
                openScreen(context, ScreenUserAppRating());
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
              leading: Icon(Icons.logout, color: Color(0xff2FB8A6),),
              title: Text("Logout",style: genr,),
              onTap: () async {
                await signOut().then((value){
                  openScreenAndCloseOthers(context, ScreenBusinessAppLogIn());
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
