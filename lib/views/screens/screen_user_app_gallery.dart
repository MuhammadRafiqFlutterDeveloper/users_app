import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File selectedImage;
  String base64Image = "";

  Future<void> chooseImage(type) async {
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
    } else {
      image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
    }
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        base64Image = base64Encode(selectedImage.readAsBytesSync());
        // won't have any error now
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 40,),
                      selectedImage != null
                          ? Image.file(
                        selectedImage,
                        fit: BoxFit.cover,
                        height: 200,
                        width: 300,
                      )
                          : Image.network(
                        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                      ),


                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _choiseShowDialog(context);
                },
                child: Text(" Select Image From"),
              ),
            ],
          ),
        ));
  }
  Future<void> _choiseShowDialog(BuildContext context)async {
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Select Image From"),
        actions: [
          GestureDetector(
            child: Text("Gallery"),
            onTap: (){
              chooseImage("Gallery");
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.all(10),
            child: GestureDetector(
              child: Text("camera"),
              onTap: (){
                chooseImage("camera");
                Navigator.pop(context);
              },
            ),
          ),
        ],
      );
    });
  }
}
