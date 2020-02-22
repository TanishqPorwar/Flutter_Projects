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
      color: Color(0xff24213B),
      child: Text(
        data,
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 1.5,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    );
  }
}
