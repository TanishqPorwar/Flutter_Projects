import 'package:flutter/material.dart';
import 'package:game_message_ui/src/model/forum.dart';
import 'package:game_message_ui/src/style/colors.dart';
import 'package:game_message_ui/src/style/test_style.dart';

class ForumNameWidget extends StatelessWidget {
  final Forum forum;
  ForumNameWidget({this.forum});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      color: primaryColor,
      shape: ForumNameCustomShapeBorder(),
      child: Padding(
        padding: const EdgeInsets.only(top: 22, left: 16, right: 24),
        child: Text(
          forum.title,
          style: forumNameTextStyle,
        ),
      ),
    );
  }
}

class ForumNameCustomShapeBorder extends ShapeBorder {
  final double intialDistance = 12;
  final double controlPointDistance = 2;

  @override
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return getClip(Size(125, 60));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return null;
  }

  Path getClip(Size size) {
    Path clippedPath = Path();
    // move to starting point (12,0)
    clippedPath.moveTo(intialDistance, 0);
    // draw a curve from starting point (12,0) to end point (0,12)
    // about control point (2,2)
    clippedPath.quadraticBezierTo(
      controlPointDistance,
      controlPointDistance,
      0,
      intialDistance,
    );
    // draw line from current point (0,12) to (0,height-12)
    clippedPath.lineTo(0, size.height - intialDistance);
    // draw a curve from starting point (0,height-2) to end point (12,height)
    // about control point (2,height-2)
    clippedPath.quadraticBezierTo(
      controlPointDistance,
      size.height - controlPointDistance,
      intialDistance,
      size.height,
    );
    // draw line from current point (12,height) to (width-12,height)
    clippedPath.lineTo(size.width - intialDistance, size.height);
    // draw a curve from starting point (width-12,height) to end point (width,height-12)
    // about control point (width-2,height-2)
    clippedPath.quadraticBezierTo(
      size.width - controlPointDistance,
      size.height - controlPointDistance,
      size.width,
      size.height - intialDistance,
    );
    // draw line from current point (width,height-12) to (width,height*0.6)
    clippedPath.lineTo(size.width, size.height * 0.6);
    clippedPath.quadraticBezierTo(
      size.width - 1,
      size.height * 0.6 - intialDistance,
      size.width - intialDistance,
      size.height * 0.6 - intialDistance - 3,
    );
    clippedPath.lineTo(intialDistance + 6, 0);
    clippedPath.close();
    return clippedPath;
  }
}
