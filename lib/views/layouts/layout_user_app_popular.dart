import 'package:flutter/material.dart';
import 'package:users_app/helps/helper.dart';

class LayoutUserAppPopular extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.all(5),
      height: 130,
      width: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/hd/5.jfif",
          ),
          fit: BoxFit.fill
        ),
      ),
      child: Text(
        "Suasion Japan",
        style: button,
      ),
    );
  }
}
