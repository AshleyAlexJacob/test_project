import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_1/demoRepo/carRepo.dart';
import 'package:project_1/screens/carDetail.dart/carDetail.dart';
import 'package:project_1/shared/NavigationDrawer/app_drawer.dart';
import 'package:project_1/shared/constants.dart';
import 'package:project_1/shared/popularCardCard.dart';

class PopularCars extends StatefulWidget {
  @override
  _PopularCarsState createState() => _PopularCarsState();
}

class _PopularCarsState extends State<PopularCars> {
  List<bool> favCar = [];

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
          'POPULAR CARS',
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
      child: Column(
        children: [
          _searchBar(),
          _carArea(),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 3,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                onChanged: null,
                decoration: InputDecoration(
                  hintText: 'Search Popular Cars',
                  border: InputBorder.none,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Icon(
              Icons.search,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget _carArea() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.768,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: CarRepo().cars.length,
        // itemCount: 6,
        itemBuilder: (context, index) {
          return PopularCarCard(
            myCar: CarRepo().cars[index],
            onPress: () {
              Navigator.push(
                context,
                PageTransition(
                    child: CarDetail(
                      myCar: CarRepo().cars[index],
                    ),
                    type: PageTransitionType.leftToRight),
              );
            },
          );
        },
      ),
    );
  }
}
