import 'package:flutter/material.dart';
import 'package:project_1/shared/constants.dart';

class CarCard extends StatelessWidget {
  final String image;
  final int rating;
  final bool active;
  final String name;
  final VoidCallback favCallback;
  final VoidCallback onPress;
  CarCard(
      {this.name,
      this.image,
      this.rating,
      this.active,
      this.favCallback,
      this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress ?? () {},
      child: Container(
        margin: EdgeInsets.only(right: 5.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[50],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        width: 250,
        child: Column(
          children: [
            ClipRRect(
              child: Stack(
                children: [
                  Container(
                    height: 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          image ?? '',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.0, top: 5.0),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 20,
                          // margin: EdgeInsets.only(left: 5.0, top: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: SharedConstants().purple,
                          ),
                          child: Center(
                            child: Text(
                              rating.toDouble().toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      name ?? 'Error',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'OP_S',
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      active
                          ? Icons.favorite_rounded
                          : Icons.favorite_outline_rounded,
                      size: 25,
                      color: SharedConstants().purple,
                    ),
                    onPressed: favCallback,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
