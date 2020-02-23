import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final String data;
  final void Function() onPressed;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  BuildButton({
    @required this.data,
    @required this.onPressed,
    this.borderRadius = 10.0,
    this.padding = const EdgeInsets.all(0),
  });
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 5.0,
      onPressed: onPressed,
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      color: Color(0xff051F1B),
      child: Text(
        data,
        style: TextStyle(
          color: Color(0xff1D5B3D),
          // letterSpacing: 1.5,
          fontSize: 25,
          fontWeight: FontWeight.w800,
          fontFamily: "madhack",
        ),
      ),
    );
  }
}
