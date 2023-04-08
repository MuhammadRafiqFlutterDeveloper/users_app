import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users_app/helps/helper.dart';
import '../../main.dart';

class ScreenUserAppFilter extends StatefulWidget {

  @override
  State<ScreenUserAppFilter> createState() => _ScreenUserAppFilterState();
}


class _ScreenUserAppFilterState extends State<ScreenUserAppFilter> {
  int age = 10;
  double start = 30.0;
  double end = 50.0;
  bool mon = false;
  bool wen = false;
  bool tue = false;
  bool thu = false;
  bool fri = false;
  bool loading = false;
  Future<String> Filter() async {
    CollectionReference products =
    FirebaseFirestore.instance.collection('filter');
    products.add({
      'age': age,
      'start': start,
      'end': end,
      'mon': mon,
      'wen': wen,
      'tue': tue,
      'thu': thu,
      'fri': fri,
    }).whenComplete(() {
      displayMessage('Filter Successfully');
    });
    return "hell";
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text("Filters", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black,),),
        leading: IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon(Icons.arrow_back_ios, color: Colors.black,),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 20, top: 20),
                child: Text("Price", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black,),)),
            Container(
              margin: EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              child: Text(
                "\$: " +
                    start.toStringAsFixed(2) +
                    "\$: " +
                    end.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: colors
                ),
              ),
            ),
            RangeSlider(
              activeColor: Color(0xff2FB8A6),
              inactiveColor: Color(0xffC4C4C4),
              values: RangeValues(start, end),
              labels: RangeLabels(start.toString(), end.toString()),
              onChanged: (value) {
                setState(() {
                  start = value.start;
                  end = value.end;
                });
              },
              min: 10,
              max: 80,
            ),
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 20, top: 20),
                child: Text("Distance from me", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black,),)),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 20),
              child: Text(
                age.toString() + " Miles",
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff2FB8A6)
                ),
              ),
            ),
            Slider(
              activeColor: Color(0xff2FB8A6),
              inactiveColor: Color(0xffC4C4C4),
              label: "Select Age",
              value: age.toDouble(),
              onChanged: (value) {
                setState(() {
                  age = value.toInt();
                });
              },
              min: 5,
              max: 100,
            ),
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10, top: 20),
                child: Text("Category", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black,),)),
            SizedBox(height: 20,),
            CheckboxListTile(
                activeColor: Color(0xff2FB8A6),
                title: Text("Hotels & Restaurants", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                value: mon,
                onChanged: (val){
                  setState(() {
                    mon = val;
                  });
                }

            ),
            CheckboxListTile(
                activeColor: Color(0xff2FB8A6),
                title: Text("Gym & Exercise", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                value: tue,
                onChanged: (val){
                  setState(() {
                   tue = val;
                  });
                }

            ),
            CheckboxListTile(
                activeColor: Color(0xff2FB8A6),
                title: Text("Hiking trails & Reviers", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                value: wen,
                onChanged: (value){
                  setState(() {
                    wen = value;
                  });
                }

            ),
            CheckboxListTile(
                activeColor: Color(0xff2FB8A6),
                title: Text("Outdoor Activities", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                value: thu,
                onChanged: (value){
                  setState(() {
                    thu = value;
                  });
                }

            ),
            CheckboxListTile(
                activeColor: Color(0xff2FB8A6),
                title: Text("Indoor Activities", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                value: fri,
                onChanged: (value){
                  setState(() {
                    fri = value;
                  });
                }

            ),
            SizedBox(height: 20,),
           loading? CircularProgressIndicator(): TextButton(
              style: TextButton.styleFrom(
                  minimumSize: Size(264, 40),
                  backgroundColor: Color(0xff2FB8A6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
              onPressed: () {
                setState(() {
                  loading = true;
                });
                Filter();
                setState(() {
                  loading = false;
                });
              },
              child: Text(
                  "Apply",
                  style: GoogleFonts.getFont("Roboto",
                    color: Colors.white,
                    fontSize: 18, fontWeight: FontWeight.w600,
                  )
              ),
            ),

          ],
        ),
      ),
    );
  }
}
