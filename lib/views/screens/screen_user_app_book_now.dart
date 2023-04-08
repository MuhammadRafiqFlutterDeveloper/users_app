import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users_app/helps/helper.dart';
import 'package:users_app/views/layouts/layout_user_app_map.dart';
import 'package:users_app/views/screens/screen_user_app_detail.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../../main.dart';
import '../../provider/user_models.dart';

class ScreenUserAppBookNow extends StatefulWidget {
  final snap;
  final postUid;
  const ScreenUserAppBookNow({
    Key key,
    this.snap, this.postUid,
  }) : super(key: key);

  @override
  State<ScreenUserAppBookNow> createState() => _ScreenUserAppBookNowState();
}

class _ScreenUserAppBookNowState extends State<ScreenUserAppBookNow> {
  double _rating = 0;
  String _selectedId;
  @override
  Widget build(BuildContext context) {
    final words = widget.snap['images'].toString();
    final provider = FavoriteProvider.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              widget.snap['images'].toString(),
            ),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      provider.toggleFavorite(words);
                    },
                    icon: provider.isExist(words)
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : const Icon(Icons.favorite_border),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 70,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.80)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            widget.snap['name'].toString(),
                            style: button,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Text(
                            widget.snap['price'].toString(),
                            style: button,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 0),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.location_on,
                                  color: colors,
                                ),
                                onPressed: () {
                                  Get.to(LayoutUserAppGoogleMap());
                                },
                              ),
                              Text(
                                " 2 miles away ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 20),
                      child: RatingBarIndicator(
                        rating: 2.75,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 10.0,
                        direction: Axis.horizontal,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 40),
                        maximumSize: Size(264, 40),
                        backgroundColor: colors,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return MyDialog(
                              onValueChange: _onValueChange,
                              initialValue: _selectedId,
                            );
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Image(
                            image: AssetImage(
                              "assets/images/img.png",
                            ),
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Book now",
                            style: GoogleFonts.getFont(
                              "Roboto",
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: TextButton(
                onPressed: () {
                  openScreen(context, ScreenUserAppDetail());
                },
                child: Text(
                  "view More Detail",
                  style: button,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onValueChange(String value) {
    setState(
      () {
        _selectedId = value;
      },
    );
  }
}

class MyDialog extends StatefulWidget {
  const MyDialog({this.onValueChange, this.initialValue, this.postUid});
  final postUid;
  final String initialValue;
  final void Function(String) onValueChange;

  @override
  State createState() => new MyDialogState();
}

class MyDialogState extends State<MyDialog> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(2022, 11, 5),
    end: DateTime(2022, 11, 10),
  );

  int _countVal = 0;

  int get countVal => _countVal;

  int countV = 0;

  int get count => countV;
  int coun = 0;
  int get counted => coun;
  void addd() {
    coun++;
  }

  void subtracted() {
    coun--;
  }

  void ad() {
    countV++;
  }

  void s() {
    countV--;
  }

  void add() {
    _countVal++;
  }

  void subtract() {
    _countVal--;
  }

  bool lading = false;
  Widget build(BuildContext context) {
    final started = dateRange.start;
    final ended = dateRange.end;
    return SimpleDialog(
      title: Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Depart Date",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            Text(
              "Return Date",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colors,
              ),
              onPressed: pickDateRange,
              child: Text(
                DateFormat.yMMMd().format(started),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colors,
              ),
              onPressed: pickDateRange,
              child: Text(
                DateFormat.yMMMd().format(ended),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Number of Rooms',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(
                  () {
                    countVal;
                  },
                );
                subtract();
              },
              icon: Icon(
                Icons.remove_circle_outline,
                color: colors,
              ),
            ),
            Text(
              '${countVal.toString()}',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(
                  () {
                    countVal;
                  },
                );
                add();
              },
              icon: Icon(
                Icons.add_circle_outline,
                color: Color(0xff2FB8A6),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            RichText(
              text: TextSpan(
                text: 'Adults ',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: '(age 15+)',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                setState(
                  () {
                    count;
                  },
                );
                s();
              },
              icon: Icon(
                Icons.remove_circle_outline,
                color: colors,
              ),
            ),
            Text(
              '${count.toString()}',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(
                  () {
                    count;
                  },
                );
                ad();
              },
              icon: Icon(
                Icons.add_circle_outline,
                color: Color(0xff2FB8A6),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            RichText(
              text: TextSpan(
                text: 'Children ',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: '(age 0 to 15)',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                setState(
                  () {
                    counted;
                  },
                );
                subtracted();
              },
              icon: Icon(
                Icons.remove_circle_outline,
                color: colors,
              ),
            ),
            Text(
              '${counted.toString()}',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  counted;
                });
                addd();
              },
              icon: Icon(
                Icons.add_circle_outline,
                color: Color(0xff2FB8A6),
              ),
            ),
          ],
        ),
        lading
            ? Center(
                child: CircularProgressIndicator(
                  color: colors,
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors,
                  ),
                  onPressed: () {
                    setState(() {
                      lading = true;
                    });
                    addData().whenComplete(() {
                      Navigator.pop(context);
                      displayMessage(
                        'Your Request Sent to Admin Successfully Please Wait for Response',
                      );
                    });
                    setState(
                      () {
                        lading = false;
                      },
                    );
                  },
                  child: Text(
                    'Book Now',
                    style: buttons,
                  ),
                ),
              ),
      ],
    );
  }

  Future pickDateRange() async {
    DateTimeRange newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      lastDate: DateTime(2100),
      firstDate: DateTime(1900),
    );
    if (newDateRange == null) return;
    setState(() => dateRange = newDateRange);
  }

  CollectionReference products = FirebaseFirestore.instance.collection('book');
  String postUid = Uuid().v1();
  String uid = Uuid().v1();
  Future addData() async {
    await products.doc(uid).set(
      {
        'uid': FirebaseAuth.instance.currentUser.uid,
        'room': countVal.toString().trim(),
        'adults': counted.toString().trim(),
        'children': count.toString().trim(),
        'date': dateRange.toString().trim(),
        'dateNow': DateTime.now(),
        'status': '',
        'postUid': widget.postUid,
        'bookId': uid,
      },
    ).whenComplete(
      () {
        Navigator.pop(context);
        displayMessage(
          'Your Request Sent to Admin Successfully Please Wait for Response',
        );
      },
    );
  }
}
