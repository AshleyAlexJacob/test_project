import 'package:flutter/material.dart';
import 'package:project_1/shared/constants.dart';

class FormContainer extends StatelessWidget {
  final Widget child;
  FormContainer({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.grey[200],
      child: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: SharedConstants().purple,
        ),
        child: child,
      ),
    );
  }
}
