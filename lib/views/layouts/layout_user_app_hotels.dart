// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:users_app/helps/helper.dart';
// import '../../utills/utils.dart';
// import '../screens/screen_user_app_book_now.dart';
// import 'layout_user_app_map.dart';
//
// class LayoutUserAppHotels extends StatefulWidget {
//   final snap;
//   const LayoutUserAppHotels({Key key, this.snap}) : super(key: key);
//
//   @override
//   State<LayoutUserAppHotels> createState() => _LayoutUserAppHotelsState();
// }
//
// class _LayoutUserAppHotelsState extends State<LayoutUserAppHotels> {
//   double _rating = 0;
//   int commentLen = 0;
//   bool isLikeAnimating = false;
//
//   var index;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchCommentLen();
//   }
//
//   fetchCommentLen() async {
//     try {
//       QuerySnapshot snap = await FirebaseFirestore.instance
//           .collection('posts')
//           .doc(widget.snap['postId'])
//           .collection('comments')
//           .get();
//       commentLen = snap.docs.length;
//     } catch (err) {
//       showSnackBar(
//         context,
//         err.toString(),
//       );
//     }
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           height: 180,
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             image: DecorationImage(
//               image: NetworkImage(
//                 widget.snap['images'].toString(),
//               ),
//               fit: BoxFit.fill,
//             ),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.only(left: 20, right: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 widget.snap['name'].toString(),
//                 style: genr,
//               ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(110, 37),
//                   backgroundColor: Color(0xff2FB8A6),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return ScreenUserAppBookNow(
//                           images: 'images',
//                         );
//                       },
//                     ),
//                   );
//                 },
//                 child: Text(
//                   "Book now",
//                   style: button,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           alignment: Alignment.centerLeft,
//           margin: EdgeInsets.only(left: 20),
//           child: Text(
//             widget.snap['price'].toString(),
//             style: gen,
//           ),
//         ),
//         Container(
//           alignment: Alignment.centerRight,
//           margin: EdgeInsets.only(right: 20),
//           child: RatingBar.builder(
//             maxRating: 1,
//             itemSize: 15,
//             itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
//             onRatingUpdate: (_rating) {
//               setState(
//                 () {
//                   this._rating = _rating;
//                 },
//               );
//             },
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.only(left: 15),
//           child: TextButton(
//             onPressed: () {
//               openScreen(context, LayoutUserAppGoogleMap());
//             },
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Icon(
//                   Icons.location_on,
//                   color: colors,
//                 ),
//                 Text(
//                   "Location",
//                   style: genr,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
