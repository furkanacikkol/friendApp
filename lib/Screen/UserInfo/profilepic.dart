import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saglik/customwidget/mybutton.dart';

class ProfilPicPage extends StatefulWidget {
  @override
  _ProfilPicPageState createState() => _ProfilPicPageState();
}

class _ProfilPicPageState extends State<ProfilPicPage> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Flexible(
              child: _image != null ? Image.file(_image) : Text('no Image')),
          MyButton(
              text: "Resim seç",
              onCustomButtonPressed: () => getImage(),
              icon: Icon(Icons.add)),

        ],
      ),
    );
  }
}
