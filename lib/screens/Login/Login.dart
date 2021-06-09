import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_1/screens/SignUp/signUp.dart';
import 'package:project_1/screens/home/home.dart';
import 'package:project_1/screens/yourCars/yourCars.dart';
import 'package:project_1/shared/NavigationDrawer/app_drawer.dart';
import 'package:project_1/shared/constants.dart';
import 'package:project_1/shared/formContainer.dart';
import 'package:project_1/shared/userType.dart';

class Login extends StatefulWidget {
  final userType type;
  Login({this.type});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  String email = '';

  String password = '';
  String error = '';

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
          'LOGIN',
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
            height: 60,
          ),
          CircleAvatar(
            backgroundColor: SharedConstants().yellow,
            radius: 60,
            child: Center(
              child: Icon(
                FontAwesomeIcons.userCircle,
                size: 80,
                color: Colors.black,
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
              height: 40,
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
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                // works only and only if the validators return null
                if (_formKey.currentState.validate()) {
                  // setState(() {
                  //   _loading = true;
                  // });
                  print('Im Here');
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
                    'LOGIN',
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
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have a account?",
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    PageTransition(
                        child: SignUp(
                          type: widget.type,
                        ),
                        type: PageTransitionType.leftToRight),
                  ),
                  child: Text(
                    'Register',
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
