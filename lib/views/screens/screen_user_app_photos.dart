import 'package:flutter/material.dart';
class ScreenUserAppPhotos extends StatefulWidget {

  @override
  State<ScreenUserAppPhotos> createState() => _ScreenUserAppPhotosState();
}
class _ScreenUserAppPhotosState extends State<ScreenUserAppPhotos> {
  // final List<Map> myProducts =
  // List.generate(100000, (index) => {"id": index, "name": "Product $index"})
  //     .toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Photos", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.black,),),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        shrinkWrap: true,
        children: List.generate(20, (index) {
          return Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Rectangle82.png'),
                  fit: BoxFit.fill,
                ),
                borderRadius:
                BorderRadius.all(Radius.circular(5.0),),
              ),
            ),
          );
        },),
      ),
    );
  }
}
