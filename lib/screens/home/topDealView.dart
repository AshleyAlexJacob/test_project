import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_1/demoRepo/carRepo.dart';
import 'package:project_1/screens/carDetail.dart/carDetail.dart';
import 'package:project_1/shared/carCard.dart';
import 'package:project_1/shared/topCarCard.dart';

class TopDealView extends StatefulWidget {
  @override
  _TopDealViewState createState() => _TopDealViewState();
}

class _TopDealViewState extends State<TopDealView> {
  List<bool> favCar = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: CarRepo().topCars.length,
        // itemCount: 6,
        itemBuilder: (context, index) {
          favCar.add(false);
          return TopCarCard(
            car: CarRepo().topCars[index],
            active: favCar[index],
            onPress: () {
              Navigator.push(
                context,
                PageTransition(
                    child: CarDetail(
                      myCar: CarRepo().topCars[index],
                    ),
                    type: PageTransitionType.leftToRight),
              );
            },
            favCallback: () {
              setState(() {
                favCar[index] = !favCar[index];
              });
            },
          );
        });
  }
}
