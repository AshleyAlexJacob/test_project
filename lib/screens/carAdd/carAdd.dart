import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_1/screens/notificationScreen/notificationScreen.dart';
import 'package:project_1/screens/yourCars/yourCars.dart';
import 'package:project_1/shared/NavigationDrawer/app_drawer.dart';
import 'package:project_1/shared/constants.dart';
import 'package:project_1/shared/formContainer.dart';

class CarAdd extends StatefulWidget {
  @override
  _CarAddState createState() => _CarAddState();
}

class _CarAddState extends State<CarAdd> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _makeController = TextEditingController();
  TextEditingController _colorController = TextEditingController();
  TextEditingController _kmController = TextEditingController();
  TextEditingController _yearController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  File _image;
  final picker = ImagePicker();
  _imgFromCamera() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      if (pickedFile != null)
        _image = File(pickedFile.path);
      else
        print('No Image Selected');
    });
  }

  _imgFromGallery() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (pickedFile != null)
        _image = File(pickedFile.path);
      else
        print('No Image Selected');
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: SharedConstants().yellow,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'ADD YOUR CAR',
          style: TextStyle(
            fontSize: 25,
            color: SharedConstants().purple,
            // letterSpacing: 1.5,
            fontFamily: 'Bison',
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(FontAwesomeIcons.solidBell),
              color: SharedConstants().purple,
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                      child: NotificationScreen(),
                      type: PageTransitionType.leftToRight),
                );
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        backgroundColor: SharedConstants().yellow,
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Text(
            "Add",
            style: TextStyle(
                fontSize: 18, fontFamily: 'OP_S', color: Colors.black),
          ),
        ),
        onPressed: () {
          // works only and only if the validators return null
          if (_formKey.currentState.validate()) {
            // setState(() {
            //   _loading = true;
            // });
            Navigator.pushReplacement(
                context,
                PageTransition(
                    child: YourCars(), type: PageTransitionType.leftToRight));
          } else {}
        },
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: ListView(
        children: [
          _imageBox(),
          _formArea(),
          // _buttonArea(),
        ],
      ),
    );
  }

  Widget _imageBox() {
    return Center(
      child: GestureDetector(
        onTap: () {
          _showPicker(context);
        },
        child: _image != null
            ? Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: SharedConstants().yellow, width: 3.0),
                ),
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(
                    _image,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: SharedConstants().yellow, width: 3.0),
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20)),
                width: double.maxFinite,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.carAlt,
                      size: 70,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Add Image of the Car',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _formArea() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            FormContainer(
              child: Theme(
                data: Theme.of(context).copyWith(
                  primaryColor: SharedConstants().purple,
                ),
                child: TextFormField(
                    controller: _nameController,
                    validator: (val) =>
                        val.isEmpty ? 'Please Provide the name' : null,
                    decoration:
                        SharedConstants().form2Decor(hint: 'Enter Name')),
              ),
            ),
            FormContainer(
              child: TextFormField(
                controller: _colorController,
                validator: (val) =>
                    val.isEmpty ? 'Please Provide the color of the Car' : null,
                decoration: SharedConstants().form2Decor(hint: 'Enter Color'),
              ),
            ),
            FormContainer(
              child: TextFormField(
                  controller: _makeController,
                  validator: (val) => val.isEmpty
                      ? 'Please Provide the maker of the Car'
                      : null,
                  decoration:
                      SharedConstants().form2Decor(hint: 'Enter Maker')),
            ),
            FormContainer(
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _kmController,
                  validator: (val) => val.isEmpty
                      ? 'Please Provide the KM\'s of the Car'
                      : null,
                  decoration: SharedConstants().form2Decor(hint: 'Enter KM')),
            ),
            FormContainer(
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _yearController,
                  validator: (val) =>
                      val.isEmpty ? 'Please Provide the year of the Car' : null,
                  decoration: SharedConstants().form2Decor(hint: 'Enter Year')),
            ),
            FormContainer(
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _priceController,
                  validator: (val) => val.isEmpty
                      ? 'Please Provide the price of the Car'
                      : null,
                  decoration:
                      SharedConstants().form2Decor(hint: 'Enter Price')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonArea() {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        // width: 250,
        height: 60,
        decoration: BoxDecoration(
          color: SharedConstants().yellow,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            'Add',
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              letterSpacing: 1.0,
              fontFamily: 'OP_S',
            ),
          ),
        ),
      ),
    );
  }
}
