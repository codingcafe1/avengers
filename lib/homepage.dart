import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  Future<File> imageFile;
  File _image;
  String result = '';
  ImagePicker imagePicker;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
    loadDataModelFiles();
  }

  loadDataModelFiles() async{}

  doImageClassification() async{}


  selectPhoto() async{
    PickedFile pickedFile =
        await imagePicker.getImage(source: ImageSource.gallery);
    _image = File(pickedFile.path);
    setState(() {
      _image;
      doImageClassification();
    });
  }

  capturePhoto() async{
    PickedFile pickedFile =
    await imagePicker.getImage(source: ImageSource.camera);
    _image = File(pickedFile.path);
    setState(() {
      _image;
      doImageClassification();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
                fit: BoxFit.cover
            )
          ),
          child: Column(
            children: [
              SizedBox(width: 100),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Stack(children: <Widget>[
                  Center(
                    child: FlatButton(
                      onPressed: selectPhoto,
                      onLongPress: capturePhoto,
                      child: Container(
                        margin: EdgeInsets.only(top: 30, right: 35, left: 18),
                        child: _image != null
                        ? Image.file(
                          _image,
                        height: 160,
                        width: 400,
                        fit: BoxFit.cover,
                        )
                          : Container(
                            width: 140,
                            height: 190,
                          child: Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                        ),
                        ),
                      ),
                    ),
                  ),
                ],),
              ),
              SizedBox(height: 160),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  '$result',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Brand Bold',
                      fontSize: 40,
                      color: Colors.pinkAccent,
                      backgroundColor: Colors.white60),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
