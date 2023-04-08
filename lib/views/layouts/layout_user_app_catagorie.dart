import 'package:flutter/material.dart';
import 'package:users_app/helps/helper.dart';

import '../screens/screen_user_app_outdoor_activity.dart';
class LayoutUserAppCatagorie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.50),
                blurRadius: 4,
              ),
            ],
          ),
          child: ListTile(
            leading: Image.asset("assets/hd/1.jfif", width: 65, height: 60,),
            title: Text("Hotels & Restaurants", style: genr,),
            trailing: Icon(Icons.arrow_forward_ios_outlined, color: Colors.black,size: 16,),
         onTap: (){
              openScreen(context, ScreenUserAppOutdoorActivity());
         },
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.50),
                blurRadius: 4,
              ),
            ],
          ),
          child: ListTile(
            leading: Image.asset("assets/hd/2.jfif", width: 65,height: 60,),
            title: Text("Gym & Exercise", style: genr,),
            trailing: Icon(Icons.arrow_forward_ios_outlined, color: Colors.black,size: 16,),
            onTap: (){
              openScreen(context, ScreenUserAppOutdoorActivity());
            },
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.50),
                blurRadius: 4,
              ),
            ],
          ),
          child: ListTile(
            leading: Image.asset("assets/hd/6.jfif", width: 65, height: 60,),
            title: Text("Hiking trails & Revers", style: genr,),
            trailing: Icon(Icons.arrow_forward_ios_outlined, color: Colors.black,size: 16,),
            onTap: (){
              openScreen(context, ScreenUserAppOutdoorActivity());
            },
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.50),
                blurRadius: 4,
              ),
            ],
          ),
          child: ListTile(
            leading: Image.asset("assets/hd/5.jfif", width: 65, height: 60,),
            title: Text("Hotels & Restaurants", style: genr,),
            trailing: Icon(Icons.arrow_forward_ios_outlined, color: Colors.black,size: 16,),
            onTap: (){
             openScreen(context, ScreenUserAppOutdoorActivity());
            },
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.50),
                blurRadius: 4,
              ),
            ],
          ),
          child: ListTile(
            leading: Image.asset("assets/hd/4.jfif", height: 60, width: 65,),
            title: Text("Indoor Activities", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black,),),
            trailing: Icon(Icons.arrow_forward_ios_outlined, color: Colors.black,size: 16,),
            onTap: (){
              openScreen(context, ScreenUserAppOutdoorActivity());
            },
          ),
        ),
      ],
    );
  }
}
