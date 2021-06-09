import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_1/screens/myBookedCars/myBookedCars.dart';
import 'package:project_1/shared/constants.dart';

class MyCarsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
              child: MyBookedCars(), type: PageTransitionType.leftToRight),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: 16, right: 10, left: 10),
        child: Container(
          decoration: BoxDecoration(
            color: SharedConstants().purple,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          padding: EdgeInsets.all(24),
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/p1.jpg'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Booked Cars",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Cars: 4",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                height: 45,
                width: 45,
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: SharedConstants().purple,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
