import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_1/demoRepo/carRepo.dart';
import 'package:project_1/screens/carDetail.dart/carDetail.dart';
import 'package:project_1/shared/carCard.dart';

class PopularCarView extends StatefulWidget {
  @override
  _PopularCarViewState createState() => _PopularCarViewState();
}

class _PopularCarViewState extends State<PopularCarView> {
  List<bool> favCar = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: CarRepo().cars.length,
        // itemCount: 6,
        itemBuilder: (context, index) {
          favCar.add(false);
          return CarCard(
            name: CarRepo().cars[index].name,
            image: CarRepo().cars[index].imageUrl,
            rating: CarRepo().cars[index].rating,
            active: favCar[index],
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
            favCallback: () {
              setState(() {
                favCar[index] = !favCar[index];
              });
            },
          );
        });
  }
}
