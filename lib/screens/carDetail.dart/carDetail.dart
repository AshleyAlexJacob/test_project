import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_1/model/car.dart';
import 'package:project_1/screens/costBreakdown/costBreakdown.dart';
import 'package:project_1/shared/NavigationDrawer/app_drawer.dart';
import 'package:project_1/shared/constants.dart';
import 'package:project_1/shared/opButton.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class CarDetail extends StatefulWidget {
  final Car myCar;
  CarDetail({this.myCar});

  @override
  _CarDetailState createState() => _CarDetailState();
}

class _CarDetailState extends State<CarDetail> {
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
          'CAR DETAIL',
          style: TextStyle(
            fontSize: 25,
            color: SharedConstants().purple,
            fontFamily: 'Bison',
          ),
        ),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          _imageArea(),
          _carData(),
          _button(),
        ],
      ),
    );
  }

  Widget _imageArea() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: SharedConstants().yellow, width: 3.0),
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    widget.myCar.imageUrl ?? '',
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
                        widget.myCar.rating.toDouble().toString(),
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
    );
  }

  Widget _carData() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.myCar.year,
            style: TextStyle(fontSize: 17),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.myCar.name,
                style: TextStyle(fontSize: 30, fontFamily: 'OP_B'),
              ),
            ],
          ),

          SizedBox(
            height: 20,
          ),
          Text(
            'DETAILS',
            style: TextStyle(fontSize: 17, fontFamily: 'OP_S'),
          ),
          Divider(
            color: Colors.grey[800],
          ),

          // detail(title: 'Name:', detail: myCar.name),
          detail(title: 'Color:', detail: widget.myCar.color),
          detail(title: 'Maker:', detail: widget.myCar.maker),
          detail(title: 'KM:', detail: widget.myCar.km),
          detail(title: 'Year:', detail: widget.myCar.year),
        ],
      ),
    );
  }

  Widget detail({String title, String detail}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title + ' ',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            detail,
            style: TextStyle(fontSize: 19, fontFamily: 'OP_S'),
          ),
        ],
      ),
    );
  }

  showD() {
    return showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          negativeText: '',
          positiveText: "Confirm",
          positiveTextStyle: TextStyle(
              color: SharedConstants().purple,
              fontFamily: 'OP_S',
              fontSize: 18),
          titleText: 'Motivation',
          contentText:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
          onPositiveClick: () {
            Navigator.push(
              context,
              PageTransition(
                child: CostBreakdown(
                  car: widget.myCar,
                ),
                type: PageTransitionType.leftToRight,
              ),
            );
          },
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 1),
    );
  }

  Widget _button() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: OPButton(
        title: 'BOOK NOW',
        onPress: () => showD(),
      ),
    );
  }
}
