import 'package:flutter/material.dart';
import 'package:project_1/shared/constants.dart';

class OPButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  OPButton({@required this.title, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress ?? () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        // width: 250,
        height: 60,
        decoration: BoxDecoration(
          color: SharedConstants().yellow,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            title ?? '',
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              letterSpacing: 1.0,
              fontFamily: 'OP_S',
            ),
          ),
        ),
      ),
    );
  }
}
