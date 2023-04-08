import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:users_app/helps/helper.dart';
import 'package:users_app/views/screens/screen_user_app_navigation.dart';
import 'package:users_app/views/screens/screens_user_app_sign_up.dart';

class ScreensUserAppVarification extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: AssetImage("assets/images/verification.png"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Verification",
                      style: genral,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Enter the OTP code sent to your phone",
                      style: gen,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Pinput(
                      keyboardType: TextInputType.number,
                      length: 4,
                      obscureText: false,
                      closeKeyboardWhenCompleted: true,
                      defaultPinTheme: PinTheme(
                        margin: EdgeInsets.all(8),
                        height: 45,
                        width: 45,
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff6F6F6F),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(blurRadius: 2, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Did not receive a code?",
                      style: gen,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      "RESEND",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: colors,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        minimumSize: Size(300, 40),
                        backgroundColor: Color(0xff2FB8A6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        )),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return ScreenUserAppNavigation();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Done",
                      style: button,
                    ),
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return ScreenBusinessAppSignUp();
                  },
                ),
              );
            },
            child: Text(
              "Change Email",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: colors,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
