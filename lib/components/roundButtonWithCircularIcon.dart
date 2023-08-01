import 'package:flutter/material.dart';

class RoundedButtonWithCircularIcon extends StatelessWidget {
  RoundedButtonWithCircularIcon(this.widget, this.onPressed);
  Widget widget;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      color: Colors.black87,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white,
        ),
        child: RawMaterialButton(
          onPressed: onPressed,
          elevation: 8.0,
          fillColor: Colors.white,
          constraints: BoxConstraints.tightFor(width: 60.0, height: 60.0),
          shape: CircleBorder(),
          child: widget,
        ),
      ),
    );
  }
}
