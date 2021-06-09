import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_1/screens/Login/Login.dart';
import 'package:project_1/screens/home/home.dart';
import 'package:project_1/shared/NavigationDrawer/app_drawer.dart';
import 'package:project_1/shared/constants.dart';
import 'package:project_1/shared/opButton.dart';
import 'package:project_1/shared/userType.dart';

class OptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: SharedConstants().yellow,
        // leading: IconButton(
        //     iconSize: 35,
        //     icon: Icon(Icons.menu, color: SharedConstants().purple),
        //     onPressed: () {}),
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'CARSUB',
          style: TextStyle(
            fontSize: 25,
            color: SharedConstants().purple,
            letterSpacing: 1.5,
            fontFamily: 'Bison',
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          // color: Colors.black.withOpacity(0.5),
          image: DecorationImage(
            image: AssetImage("assets/c3.jpg"),
            // colorFilter: ColorFilter.mode(
            //     Colors.black.withOpacity(0.4), BlendMode.hardLight),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.lighten),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: _body(context),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        OPButton(
          title: 'RENT A CAR',
          onPress: () => Navigator.push(
            context,
            PageTransition(
                child: Login(type: userType.carUser),
                type: PageTransitionType.leftToRight),
          ),
        ),
        OPButton(
          title: 'HOST A CAR',
          onPress: () => Navigator.push(
            context,
            PageTransition(
                child: Login(
                  type: userType.carHoster,
                ),
                type: PageTransitionType.leftToRight),
          ),
        ),
        OPButton(
          title: 'CONTINUE AS A GUEST',
          onPress: () => Navigator.push(
            context,
            PageTransition(child: Home(), type: PageTransitionType.leftToRight),
            // PageTransition(
            //     child: YourCars(), type: PageTransitionType.leftToRight),

            // type: PageTransitionType.leftToRight),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
