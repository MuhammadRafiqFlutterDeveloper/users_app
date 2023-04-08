import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:users_app/helps/helper.dart';
import 'dart:ui' as ui;
import 'package:users_app/views/screens/screen_user_app_help.dart';
import 'package:users_app/views/screens/screen_user_app_my_account.dart';
import 'package:users_app/views/screens/screen_user_app_notification.dart';
import 'package:users_app/views/screens/screen_user_app_setting.dart';

class ScreenUserAppMyProfile extends StatefulWidget {
  @override
  State<ScreenUserAppMyProfile> createState() => _ScreenUserAppMyProfileState();
}

class _ScreenUserAppMyProfileState extends State<ScreenUserAppMyProfile> {
  int cartItems = 0;
  // var image;
  // void getMyData() async
  // {
  //   final DocumentSnapshot userDic = (await FirebaseFirestore.instance.collection(
  //       'users').where('uid', isEqualTo: FirebaseAuth.instance.currentUser.uid)
  //       .get()) as DocumentSnapshot<Object>;
  //
  //   image = userDic.get('photoUrl');
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3,
                        child: CustomPaint(
                          painter: RPSCustomPainter(),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        top: 100,
                        left: 40,
                        child: Container(
                          height: 80,
                          width: 80,
                          child: ListView.builder(
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Expanded(
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage('${snapshot.data.docs[index]['photoUrl']}'),
                                ),
                              );
                            },
                          ),
                        )
                      ),
                      Positioned(
                        top: 50,
                        right: 30,
                        child: Badge(
                          position: BadgePosition.topEnd(top: 0, end: 3),
                          animationDuration: Duration(milliseconds: 300),
                          animationType: BadgeAnimationType.scale,
                          badgeContent: Text("$cartItems"),
                          child: IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  cartItems = 0;
                                },
                              );
                              openScreen(context, ScreenUserAppNotification());
                            },
                            icon: Icon(
                              Icons.notification_add_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                      leading: Image.asset(
                        "assets/picture/img.png",
                        height: 20,
                        width: 20,
                      ),
                      title: Text(
                        "My Account",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                        size: 18,
                      ),
                      onTap: () {
                        openScreen(context, ProfileBusinessAppMyAccount());
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                      leading: Icon(
                        Icons.settings,
                        color: Color(0xff2FB8A6),
                      ),
                      title: Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                        size: 18,
                      ),
                      onTap: () {
                        openScreen(context, ScreenUserAppSetting());
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                      leading: Icon(
                        Icons.help_outline,
                        color: Color(0xff2FB8A6),
                      ),
                      title: Text(
                        "Help",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                        size: 18,
                      ),
                      onTap: () {
                        openScreen(context, ScreenUserAppHelp());
                      },
                    ),
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint0.shader = ui.Gradient.linear(
        Offset(size.width * -0.01, size.height * 0.53),
        Offset(size.width, size.height * 0.53),
        [Color(0xff43EFD8), Color(0xff2FB8A6)],
        [0.00, 1.00]);
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width, 0);
    path0.quadraticBezierTo(size.width, size.height * 0.6413580,
        size.width * 0.9983333, size.height * 0.8592593);
    path0.cubicTo(
        size.width * 0.8504167,
        size.height * 1.0555556,
        size.width * 0.6329167,
        size.height * 1.0382716,
        size.width * 0.5016667,
        size.height * 0.8765432);
    path0.cubicTo(
        size.width * 0.3395833,
        size.height * 0.7074074,
        size.width * 0.1004167,
        size.height * 0.7197531,
        0,
        size.height * 0.9950617);
    path0.quadraticBezierTo(
        size.width * -0.0083333, size.height * 0.8216049, 0, 0);
    path0.close();
    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
