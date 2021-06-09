import 'package:flutter/material.dart';
import 'package:project_1/demoRepo/bookedCars.dart';
import 'package:project_1/demoRepo/myCarRepo.dart';
import 'package:project_1/shared/NavigationDrawer/app_drawer.dart';
import 'package:project_1/shared/bookedCarCard.dart';
import 'package:project_1/shared/constants.dart';
import 'package:project_1/shared/myCarCard.dart';

class MyBookedCars extends StatefulWidget {
  @override
  _MyBookedCarsState createState() => _MyBookedCarsState();
}

class _MyBookedCarsState extends State<MyBookedCars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: SharedConstants().yellow,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'BOOKED CARS',
          style: TextStyle(
            fontSize: 25,
            color: SharedConstants().purple,
            fontFamily: 'Bison',
          ),
        ),
      ),
      body: _body(),
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
        itemCount: BookedCarRepo().bookCars.length,
        // itemCount: 6,
        itemBuilder: (context, index) {
          return BookedCarCard(
            myCar: BookedCarRepo().bookCars[index],
            onPress: () {},
          );
        },
      ),
    );
  }
}
