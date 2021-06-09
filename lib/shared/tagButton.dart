import 'package:flutter/material.dart';
import 'package:project_1/shared/constants.dart';

class TagButton extends StatelessWidget {
  final String tagValue;
  final bool selected;
  final VoidCallback callback;
  TagButton({this.tagValue, this.selected, this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        margin: EdgeInsets.only(right: 5.0),
        width: 60,
        decoration: BoxDecoration(
          border: Border.all(
              color: selected
                  ? SharedConstants().purple
                  : SharedConstants().purple),
          borderRadius:
              selected ? BorderRadius.circular(10) : BorderRadius.circular(18),
          color: selected ? SharedConstants().purple : Colors.transparent,
        ),
        child: Center(
          child: Text(
            tagValue,
            style: TextStyle(
                fontSize: 18,
                fontFamily: selected ? 'OP_S' : 'OP_R',
                color: selected ? Colors.white : SharedConstants().purple),
          ),
        ),
      ),
    );
  }
}
