import 'package:flutter/material.dart';
import 'package:project_1/model/bookCar.dart';
import 'package:project_1/shared/constants.dart';

class BookedCarCard extends StatelessWidget {
  final BookCar myCar;
  final VoidCallback onPress;
  BookedCarCard({this.myCar, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress ?? () {},
      child: Container(
        height: 320,
        margin:
            EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0, bottom: 5.0),
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
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                          myCar.carDetail.imageUrl ?? '',
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
                              myCar.carDetail.rating.toDouble().toString(),
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
              padding: EdgeInsets.only(right: 10.0, left: 20.0, top: 10.0),
              child: Text(
                myCar.carDetail.maker ?? 'Error',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: 10.0, left: 20.0, top: 5.0, bottom: 5.0),
              child: Text(
                myCar.carDetail.name ?? 'Error',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: 'OP_S', color: Colors.black, fontSize: 25),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: 10.0, left: 20.0, top: 0.0, bottom: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Return Date: ',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  Text(
                    myCar.returnDate ?? 'Error',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'OP_S',
                        color: SharedConstants().purple,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 70.0, left: 10.0, top: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(
                        'Price:',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      Text(
                        ' ' + myCar.carDetail.price ?? 'Error',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontFamily: 'OP_S'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Color:',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      Text(
                        ' ' + myCar.carDetail.color ?? 'Error',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontFamily: 'OP_S'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 90.0, left: 00.0, top: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(
                        'KM:',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      Text(
                        ' ' + myCar.carDetail.km ?? 'Error',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontFamily: 'OP_S'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Year:',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Text(
                        ' ' + myCar.carDetail.year ?? 'Error',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'OP_S'),
                      ),
                    ],
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
