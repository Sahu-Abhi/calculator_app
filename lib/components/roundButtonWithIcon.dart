import 'package:flutter/material.dart';

class RoundedButtonWithIcon extends StatelessWidget {
  RoundedButtonWithIcon(this.widget, this.shiftText, this.onPressed);
  Widget widget;
  String shiftText;
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
        child: Stack(children: [
          Positioned(
            right: 0,
            child: Container(
              child: Text(
                shiftText,
                style: TextStyle(fontSize: 12, color: Color(0xFFb8abab)),
              ),
            ),
          ),
          RawMaterialButton(
            onPressed: onPressed,
            constraints: BoxConstraints.tightFor(width: 60.0, height: 60.0),
            child: widget,
          ),
        ]),
      ),
    );
  }
}
