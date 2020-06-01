import 'package:flutter/material.dart';
import 'package:game_message_ui/src/common/app_background.dart';
import 'package:game_message_ui/src/common/horizontal_tab_layout.dart';
import 'package:game_message_ui/src/style/colors.dart';
import 'package:game_message_ui/src/style/test_style.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(
            backgroundColor: backgroundColor,
            firstCircleColor: firstCircleColor,
            secondCircleColor: secondCircleColor,
            thirdCircleColor: thirdCircleColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Material(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.apps,
                        color: primaryColor,
                      ),
                    ),
                    shape: CircleBorder(),
                    color: Colors.white,
                  ),
                ),
              ),
              PageTitle(),
              SizedBox(
                height: 25,
              ),
              HorizontalTabLayout(),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(40))),
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                  child: Text(
                    "New Topic",
                    style: buttonStyle,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Forum", style: headingStyle),
          Text(
            "Kick of the conversation",
            style: subHeadingStyle,
          )
        ],
      ),
    );
  }
}
