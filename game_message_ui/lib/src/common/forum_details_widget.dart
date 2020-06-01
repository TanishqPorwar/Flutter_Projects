import 'package:flutter/material.dart';
import 'package:game_message_ui/src/common/label_value_widget.dart';
import 'package:game_message_ui/src/model/forum.dart';
import 'package:game_message_ui/src/model/topics.dart';
import 'package:game_message_ui/src/style/test_style.dart';

class ForumDetailsWidget extends StatelessWidget {
  final Forum forum;

  const ForumDetailsWidget({Key key, this.forum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 16, top: 24, bottom: 12),
        height: 180,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.4), width: 2),
                    ),
                    height: 40,
                    width: 40,
                    child: Center(
                      child: Text(
                        forum.rank,
                        style: rankStyle,
                      ),
                    ),
                  ),
                  Text(
                    "new",
                    style: labelTextStyle,
                  )
                ],
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LabelValueWidget(
                  value: forum.topics.length.toString(),
                  label: "topics",
                  labelStyle: labelTextStyle,
                  valueStyle: valueTextStyle,
                ),
                LabelValueWidget(
                  value: forum.threads,
                  label: "threads",
                  labelStyle: labelTextStyle,
                  valueStyle: valueTextStyle,
                ),
                LabelValueWidget(
                  value: forum.subs,
                  label: "subs",
                  labelStyle: labelTextStyle,
                  valueStyle: valueTextStyle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  final double intialDistance = 12;
  final double controlPointDistance = 2;

  @override
  Path getClip(Size size) {
    final double height = size.height;
    final double halfHeight = size.height * 0.5;
    final double width = size.width;
    Path clippedPath = Path();
    clippedPath.moveTo(0, halfHeight);
    clippedPath.lineTo(0, height - intialDistance);
    clippedPath.quadraticBezierTo(controlPointDistance,
        height - controlPointDistance, intialDistance, height);
    clippedPath.lineTo(width, height);
    clippedPath.lineTo(width, 30);
    clippedPath.quadraticBezierTo(width - 5, 5, width - 35, 15);
    clippedPath.close();
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
