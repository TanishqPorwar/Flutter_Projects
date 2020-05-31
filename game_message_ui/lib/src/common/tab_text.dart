import 'package:flutter/material.dart';
import 'package:game_message_ui/src/style/test_style.dart';

class TabText extends StatelessWidget {
  final bool isSelected;
  final String text;
  final Function onTap;

  const TabText({Key key, this.isSelected = false, this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -1.57079632679,
      child: InkWell(
        onTap: onTap,
        child: AnimatedDefaultTextStyle(
          style: (isSelected) ? selectedTabStyle : defaultTabStyle,
          duration: Duration(milliseconds: 500),
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
