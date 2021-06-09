import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_1/demoRepo/myCarRepo.dart';
import 'package:project_1/screens/carAdd/carAdd.dart';
import 'package:project_1/screens/notificationScreen/notificationScreen.dart';
import 'package:project_1/shared/NavigationDrawer/app_drawer.dart';
import 'package:project_1/shared/constants.dart';
import 'package:project_1/shared/myCarCard.dart';

class YourCars extends StatefulWidget {
  @override
  _YourCarsState createState() => _YourCarsState();
}

class _YourCarsState extends State<YourCars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: SharedConstants().yellow,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'YOUR CARS',
          style: TextStyle(
            fontSize: 25,
            color: SharedConstants().purple,
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
      body: _body(),
      floatingActionButton: FloatingActionButton(
        hoverColor: SharedConstants().purple,
        elevation: 0.0,
        backgroundColor: SharedConstants().yellow,
        child: Icon(
          FontAwesomeIcons.plus,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
                child: CarAdd(), type: PageTransitionType.leftToRight),
          );
        },
      ),
    );
  }

  Widget _body() {
    return SafeArea(
      child: _carArea(),
    );
  }

  Widget _carArea() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: MediaQuery.of(context).size.height * 0.95,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: MyCarRepo().myCars.length,
        // itemCount: 6,
        itemBuilder: (context, index) {
          return MyCarCard(
            myCar: MyCarRepo().myCars[index],
            onPress: () {},
          );
        },
      ),
    );
  }
}
