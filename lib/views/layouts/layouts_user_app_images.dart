import 'package:flutter/material.dart';

class LayoutsUserAppImages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 90,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("assets/images1/img.png"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
