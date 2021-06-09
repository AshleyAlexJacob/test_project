import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_1/screens/options/optionsScreen.dart';
import 'package:project_1/shared/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _waitAndNavigate();
  }

  _waitAndNavigate() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
        context,
        PageTransition(
            child: OptionScreen(), type: PageTransitionType.leftToRight));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedConstants().yellow,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: Text(
              'CARSUB',
              style: TextStyle(
                color: SharedConstants().purple,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height * 0.0906,
                fontFamily: 'Bison',
              ),
            ),
          ),
          // Image.asset("assets/"),
          Spacer(),
        ],
      ),
    );
  }
}
