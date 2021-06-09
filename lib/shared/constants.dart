import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SharedConstants {
  Color purple = Color(0xFF4649bc);
  Color yellow = Color(0xFFfbcb0c);
  Color grey = Color(0xFF70656c);

  InputDecoration formDecor({Widget icon, String hint}) {
    return InputDecoration(
      focusColor: SharedConstants().purple,
      icon: icon,
      // color: SharedConstants().purple,

      hintText: hint,
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    );
  }

  InputDecoration form2Decor({String hint}) {
    return InputDecoration(
      focusColor: SharedConstants().purple,
      // color: SharedConstants().purple,

      hintText: hint,
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    );
  }
}
