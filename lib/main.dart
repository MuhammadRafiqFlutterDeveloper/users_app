import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:users_app/helper/helps.dart';
import 'package:users_app/provider/user_models.dart';
import 'package:users_app/responsive/mobile_screen_layouts.dart';
import 'package:users_app/responsive/responsive_layout_screen.dart';
import 'package:users_app/responsive/web_screen_layouts.dart';
import 'package:get/get.dart';
import 'package:users_app/views/screens/screens_user_app_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

displayMessage(String Message) {
  Fluttertoast.showToast(msg: Message, toastLength: Toast.LENGTH_LONG);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FavoriteProvider(),
        ),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  // Checking if the snapshot has any data or not
                  if (snapshot.hasData) {
                    // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
                    return ResponsiveLayout(
                      mobileScreenLayout: MobileScreenLayout(),
                      webScreenLayout: WebScreenLayout(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  }
                }
                // means connection to future hasnt been made yet
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(color: colors,),
                  );
                }
                return ScreenBusinessAppLogIn();
              },
            ),
          );
        },
      ),
    );
  }
}
