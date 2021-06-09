import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_1/demoRepo/priceBreakdownRepo.dart';
import 'package:project_1/model/car.dart';
import 'package:project_1/screens/home/home.dart';
import 'package:project_1/shared/NavigationDrawer/app_drawer.dart';
import 'package:project_1/shared/constants.dart';

class CostBreakdown extends StatelessWidget {
  final Car car;
  CostBreakdown({this.car});
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
          'COST BREAKDOWN',
          style: TextStyle(
            fontSize: 25,
            color: SharedConstants().purple,
            fontFamily: 'Bison',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        hoverColor: SharedConstants().purple,
        elevation: 0.0,
        backgroundColor: SharedConstants().yellow,
        mini: true,
        onPressed: () => showD(context),
        child: Icon(
          CupertinoIcons.forward,
          color: Colors.black,
        ),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return ListView(
      children: [
        _termCondition(context),
        _priceBreakdown(context),
      ],
    );
  }

  Widget _termCondition(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.315,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TERMS & CONDITION',
            style: TextStyle(fontFamily: 'OP_B', fontSize: 20),
          ),
          Divider(
            color: Colors.grey[800],
            thickness: 1.2,
          ),
          Flexible(
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceBreakdown(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.60,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PRICE BREAKDOWN',
            style: TextStyle(fontFamily: 'OP_B', fontSize: 20),
          ),
          Divider(
            color: Colors.grey[800],
            thickness: 1.2,
          ),
          for (int index = 0;
              index < PriceBreakDownRepo().priceBreakdownList.length;
              index++)
            detail(
              title: PriceBreakDownRepo().priceBreakdownList[index].type,
              detail: PriceBreakDownRepo().priceBreakdownList[index].cost,
            ),
          Divider(
            color: Colors.grey[600],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: ',
                  style: TextStyle(fontSize: 19, fontFamily: 'OP_S'),
                ),
                Text(
                  '\$3500',
                  style: TextStyle(fontSize: 20, fontFamily: 'OP_B'),
                ),
              ],
            ),
          ),
          Text(
            'Continue With Payment',
            style: TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }

  showD(BuildContext context) {
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
          titleText: 'Confirmation',
          contentText:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
          onPositiveClick: () {
            Navigator.pushReplacement(
              context,
              PageTransition(
                child: Home(),
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
}
