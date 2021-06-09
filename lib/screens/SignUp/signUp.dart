import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_1/screens/home/home.dart';
import 'package:project_1/screens/yourCars/yourCars.dart';
import 'package:project_1/shared/NavigationDrawer/app_drawer.dart';
import 'package:project_1/shared/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_1/shared/formContainer.dart';
import 'package:project_1/shared/userType.dart';

class SignUp extends StatefulWidget {
  final userType type;
  SignUp({this.type});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _confirmPassController = TextEditingController();
  String email = '';
  File _image;
  String password = '';
  String error = '';
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
          'SIGN UP',
          style: TextStyle(
            fontSize: 25,
            color: SharedConstants().purple,
            // letterSpacing: 1.5,
            fontFamily: 'Bison',
          ),
        ),
      ),
      body: _body(context),
    );
  }

  Widget _body(context) {
    return SafeArea(
      child: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context);
              },
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Color(0xffFDCF09),
                child: _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          _image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50)),
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.camera_alt,
                          size: 50,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          ),
          _userData(),
        ],
      ),
    );
  }

  _userData() {
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
              child: TextFormField(
                controller: _firstNameController,
                validator: (val) => val.isEmpty
                    ? 'Please Provide your Legal First Name'
                    : null,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: SharedConstants().formDecor(
                  icon: Icon(
                    FontAwesomeIcons.userTag,
                  ),
                  hint: 'Legal First Name',
                ),
              ),
            ),
            FormContainer(
              child: TextFormField(
                controller: _lastNameController,
                validator: (val) => val.isEmpty
                    ? 'Please Provide your Legal Last Name'
                    : null,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: SharedConstants().formDecor(
                  icon: Icon(
                    FontAwesomeIcons.userTag,
                  ),
                  hint: 'Legal Last Name',
                ),
              ),
            ),
            FormContainer(
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: _phoneNumberController,
                validator: (val) =>
                    val.isEmpty ? 'Please Provide your phone number' : null,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: SharedConstants().formDecor(
                  icon: Icon(
                    Icons.phone_android_rounded,
                  ),
                  hint: 'Enter Phone Number',
                ),
              ),
            ),
            FormContainer(
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (val) {
                  return RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(val)
                      ? null
                      : "Please Enter Correct Email";
                },
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration: SharedConstants().formDecor(
                  icon: Icon(
                    Icons.email_rounded,
                  ),
                  hint: 'Enter Email Address',
                ),
              ),
            ),
            FormContainer(
              child: TextFormField(
                controller: _passController,
                validator: (val) =>
                    val.length < 6 ? 'Enter a password 6+ chars long' : null,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: SharedConstants().formDecor(
                  icon: Icon(
                    Icons.lock_rounded,
                  ),
                  hint: 'Enter Password',
                ),
              ),
            ),
            FormContainer(
              child: TextFormField(
                controller: _confirmPassController,
                validator: (val) => val == _passController.text
                    ? "Passwords Don't  Match"
                    : null,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: SharedConstants().formDecor(
                  icon: Icon(
                    Icons.lock_rounded,
                  ),
                  hint: 'Enter Confirm Password',
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                // works only and only if the validators return null
                if (_formKey.currentState.validate()) {
                  // setState(() {
                  //   _loading = true;
                  // });
                  if (widget.type == userType.carUser) {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        child: Home(),
                        type: PageTransitionType.leftToRight,
                      ),
                    );
                  } else if (widget.type == userType.carHoster) {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        child: YourCars(),
                        type: PageTransitionType.leftToRight,
                      ),
                    );
                  }
                } else {}
              },
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
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      letterSpacing: 1.0,
                      fontFamily: 'OP_S',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 18,
                        color: SharedConstants().purple,
                        fontFamily: 'OP_B'),
                  ),
                ),
              ],
            ),
            Text(
              error,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
