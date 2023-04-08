import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../helper/helps.dart';

class ProfileBusinessAppMyAccount extends StatefulWidget {
  final postId;
  const ProfileBusinessAppMyAccount({Key key, this.postId}) : super(key: key);

  @override
  State<ProfileBusinessAppMyAccount> createState() =>
      _ProfileBusinessAppMyAccountState();
}

class _ProfileBusinessAppMyAccountState
    extends State<ProfileBusinessAppMyAccount> {
  int selectedPc = 1;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back, color: colors,),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('uid', isEqualTo: FirebaseAuth.instance.currentUser.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text(
                "No User Fond",
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
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          '${snapshot.data.docs[index]['photoUrl']}',
                        ),
                      ),
                      // Image.network('${snapshot.data.docs[index]['images']}'),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Text(
                                "Name:  ",
                                style: appbar,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${snapshot.data.docs[index]['username']}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: colors,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Email:  ",
                                    style: appbar,
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${snapshot.data.docs[index]['email']}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: colors,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.edit_outlined,
                            color: colors,
                          ),
                          onPressed: () {
                            // Get.to(
                            //   ScreenBusinessAppUpdate(
                            //     // photo: snapshot.data.docs[index]['photoUrl'],
                            //     // name: snapshot.data.docs[index]['userName'],
                            //     // email: snapshot.data.docs[index]['email'],
                            //   ),
                            // );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}













// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// class ScreenUserAppMyAccount extends StatefulWidget {
//
//   @override
//   State<ScreenUserAppMyAccount> createState() => _ScreenUserAppMyAccountState();
// }
//
// class _ScreenUserAppMyAccountState extends State<ScreenUserAppMyAccount> {
//   int selectedPc = 1;
//   var name;
//   var image;
//   var email;
//   void getMyData() async
//   {
//     final DocumentSnapshot userDic = await FirebaseFirestore.instance.collection(
//         'users').doc(FirebaseAuth.instance.currentUser.uid)
//         .get();
//
//      name = userDic.get('username');
//      email= userDic.get('email');
//      image = userDic.get('photoUrl');
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           "My Account",
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             color: Colors.black,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: Column(
//
//         children: [
//           Stack(
//             children: [
//               Container(
//                 padding: EdgeInsets.all(7),
//                 height: 100,
//                 width: 100,
//                 margin: EdgeInsets.only(
//                   top: 15,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     width: 1,
//                     color: Colors.black,
//                   ),
//                 ),
//                 child: Image.network('${image}'),
//                 // child: Image.asset(
//                 //   "assets/grid/${selectedPc}.png",
//                 //   height: 30,
//                 //   width: 30,
//                 // ),
//               ),
//               Positioned(
//                 top: 65,
//                 left: 61,
//                 child: GestureDetector(
//                   onTap: () {
//                     showDialog(
//                       context: context,
//                       builder: (_) => AlertDialog(
//                         title: Container(
//                           alignment: Alignment.center,
//                           child: Text(
//                             "Select An Avatar",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 18,
//                             ),
//                           ),
//                         ),
//                         content: Container(
//                           height: 200,
//                           child: GridView(
//                             gridDelegate:
//                             SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 4,
//                               crossAxisSpacing: 6.0,
//                               mainAxisSpacing: 9.0,
//                             ),
//                             children: [
//                               for (int i = 1; i <= 16; i++)
//                                 GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       selectedPc = i;
//                                     });
//                                     Navigator.pop(context);
//                                   },
//                                   child: Image(
//                                     image: AssetImage(
//                                       "assets/grid/${i}.png",
//                                     ),
//                                   ),
//                                 ),
//                             ],
//                           ),
//                         ),
//                         actions: [
//                           Container(
//                             margin: EdgeInsets.symmetric(
//                                 horizontal: 30, vertical: 20),
//                             width: 270,
//                             height: 40,
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                     blurRadius: 1, color: Colors.red)
//                               ],
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: TextButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                               child: Text(
//                                 "Cancel",
//                                 style: TextStyle(
//                                   color: Colors.red,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                   child: Container(
//                     margin: EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(
//                       Icons.edit,
//                       color: Colors.white,
//                       size: 18,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 20,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                   margin: EdgeInsets.only(left: 15),
//                   child: Text("Name",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff6A6A6A),),)),
//               Container(
//                   margin: EdgeInsets.only(right: 15),
//                   child: Text("Edit",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff2FB8A6),),)),
//
//             ],
//           ),
//           SizedBox(height: 10,),
//           Container(
//             alignment: Alignment.centerLeft,
//               margin: EdgeInsets.only(left: 15),
//               child: Text("Atif Javed",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff000000),),)),
//           SizedBox(height: 20,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                   margin: EdgeInsets.only(left: 15),
//                   child: Text("Email",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff6A6A6A),),)),
//               Container(
//                   margin: EdgeInsets.only(right: 15),
//                   child: Text("Edit",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff2FB8A6),),)),
//
//             ],
//           ),
//           SizedBox(height: 10,),
//           Container(
//               alignment: Alignment.centerLeft,
//               margin: EdgeInsets.only(left: 15),
//               child: Text("abc123@gmail.com",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff000000),),)),
//         ],
//       ),
//     );
//   }
// }
