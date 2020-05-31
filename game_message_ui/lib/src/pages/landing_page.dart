import 'package:flutter/material.dart';
import 'package:game_message_ui/src/common/app_background.dart';
import 'package:game_message_ui/src/common/horizontal_tab_layout.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(),
          Align(
            alignment: Alignment.centerLeft,
            child: HorizontalTabLayout(),
          ),
        ],
      ),
    );
  }
}
