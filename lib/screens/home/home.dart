import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_1/demoRepo/carRepo.dart';
import 'package:project_1/screens/home/myCarsView.dart';
import 'package:project_1/screens/home/locationView.dart';
import 'package:project_1/screens/home/popularCarView.dart';
import 'package:project_1/screens/home/topDealView.dart';
import 'package:project_1/screens/popularCars/popularCars.dart';
import 'package:project_1/screens/topDeals/topDeals.dart';
import 'package:project_1/shared/NavigationDrawer/app_drawer.dart';
import 'package:project_1/shared/carCard.dart';
import 'package:project_1/shared/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          'CARSUB',
          style: TextStyle(
            fontSize: 25,
            color: SharedConstants().purple,
            letterSpacing: 1.5,
            fontFamily: 'Bison',
          ),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: ListView(
        children: [
          _searchBar(),
          _locationArea(),
          _popularCarsArea(),
          MyCarsView(),
          _topDealsArea(),

          // _freedomText(),
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
                  hintText: 'Search',
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

  Widget _locationArea() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      height: 100,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Location',
                style: TextStyle(fontFamily: 'OP_S', fontSize: 18),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: TextStyle(fontSize: 17, color: SharedConstants().grey),
                ),
              ),
            ],
          ),
          Container(
            height: 40,
            child: LocationView(),
          ),
        ],
      ),
    );
  }

  Widget _popularCarsArea() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      height: 250,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Cars',
                style: TextStyle(fontFamily: 'OP_S', fontSize: 18),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: PopularCars(),
                      type: PageTransitionType.leftToRight,
                    ),
                  );
                },
                child: Text(
                  'See All',
                  style: TextStyle(fontSize: 17, color: SharedConstants().grey),
                ),
              ),
            ],
          ),
          Container(
            height: 200,
            child: PopularCarView(),
          ),
        ],
      ),
    );
  }

  Widget _topDealsArea() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      height: 250,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Deals',
                style: TextStyle(fontFamily: 'OP_S', fontSize: 18),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: TopDealCars(),
                      type: PageTransitionType.leftToRight,
                    ),
                  );
                },
                child: Text(
                  'See All',
                  style: TextStyle(fontSize: 17, color: SharedConstants().grey),
                ),
              ),
            ],
          ),
          Container(
            height: 200,
            child: TopDealView(),
          ),
        ],
      ),
    );
  }
}
