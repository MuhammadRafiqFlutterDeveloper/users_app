import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:users_app/helps/helper.dart';
import 'package:users_app/views/screens/screen_user_app_book_now.dart';
import 'package:users_app/views/screens/screen_user_app_filter.dart';
import '../../utills/globle_variable.dart';
import '../layouts/layout_user_app_map.dart';

class ScreenUsrAppHotels extends StatefulWidget {
  @override
  State<ScreenUsrAppHotels> createState() => _ScreenUsrAppHotelsState();
}

class _ScreenUsrAppHotelsState extends State<ScreenUsrAppHotels> {
  final TextEditingController searchController = TextEditingController();
  bool searchState = false;
  List searchResult = [];
  String name = "";
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        title: searchState
            ? Text(
                'Hotels & Restaurants',
                style: appbar,
              )
            : Form(
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    labelText: 'Search places...',
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search_outlined,
                        color: colors,
                      ),
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      name = val;
                    });
                  },
                ),
              ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          searchState
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      searchState = !searchState;
                    });
                  },
                  icon: Icon(
                    Icons.search_outlined,
                    color: colors,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      searchState = !searchState;
                    });
                  },
                  icon: Icon(
                    Icons.cancel_outlined,
                    color: colors,
                  ),
                ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: IconButton(
              onPressed: () {
                openScreen(context, ScreenUserAppFilter());
              },
              icon: Icon(
                Icons.horizontal_split,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:  (name != "" && name != null)
            ? FirebaseFirestore.instance
            .collection('Post')
            .where("name", isGreaterThanOrEqualTo: name)
            .snapshots()
            : FirebaseFirestore.instance.collection("Post").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text(
                "No Data Found",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: colors,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (ctx, index) => Container(
                margin: EdgeInsets.symmetric(
                  horizontal: width > webScreenSize ? width * 0.3 : 0,
                  vertical: width > webScreenSize ? 15 : 0,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: NetworkImage(
                            snapshot.data.docs[index]['images'].toString(),
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            snapshot.data.docs[index]['name'].toString(),
                            style: genr,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(110, 37),
                              backgroundColor: Color(0xff2FB8A6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              openScreen(
                                  context,
                                  ScreenUserAppBookNow(
                                    postUid: snapshot.data.docs[index]['uid'],
                                    snap: snapshot.data.docs[index].data(),                                   ));
                            },
                            child: Text(
                              "Book now",
                              style: button,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        snapshot.data.docs[index]['price'].toString(),
                        style: gen,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 20),
                      child: RatingBar.builder(
                        maxRating: 1,
                        itemSize: 15,
                        itemBuilder: (context, _) =>
                            Icon(Icons.star, color: Colors.amber),
                        onRatingUpdate: (_rating) {
                          setState(
                            () {
                              this._rating = _rating;
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: TextButton(
                        onPressed: () {
                          openScreen(context, LayoutUserAppGoogleMap());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: colors,
                            ),
                            Text(
                              "Location",
                              style: genr,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  double _rating = 0;
  void initSearchingPost(String text) async {
    final result = await FirebaseFirestore.instance
        .collection('Post')
        .where('name', isGreaterThanOrEqualTo: text)
        .get();
    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }
}
