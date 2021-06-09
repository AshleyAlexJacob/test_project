import 'package:flutter/material.dart';
import 'package:project_1/screens/splash/splashScreen.dart';
import 'package:project_1/shared/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: SharedConstants().yellow,
        fontFamily: 'OP_R',
      ),
      home: SplashScreen(),
    );
  }
}
