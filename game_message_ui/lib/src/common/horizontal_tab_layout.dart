import 'package:flutter/material.dart';
import 'package:game_message_ui/src/common/forum_card.dart';
import 'package:game_message_ui/src/common/tab_text.dart';
import 'package:game_message_ui/src/model/forum.dart';
import 'package:game_message_ui/src/style/test_style.dart';

class HorizontalTabLayout extends StatefulWidget {
  @override
  _HorizontalTabLayoutState createState() => _HorizontalTabLayoutState();
}

class _HorizontalTabLayoutState extends State<HorizontalTabLayout> {
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Stack(
        children: <Widget>[
          Positioned(
            width: 110,
            top: 0,
            bottom: 0,
            left: -20,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TabText(
                    text: "Media",
                    isSelected: selectedTabIndex == 0,
                    onTap: () {
                      onTabTap(0);
                    },
                  ),
                  TabText(
                    text: "Streamers",
                    isSelected: selectedTabIndex == 1,
                    onTap: () {
                      onTabTap(1);
                    },
                  ),
                  TabText(
                    text: "Forum",
                    isSelected: selectedTabIndex == 2,
                    onTap: () {
                      onTabTap(2);
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ForumCard(
                  forum: fortniteForum,
                ),
                ForumCard(
                  forum: pubgForum,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  onTabTap(int i) {
    setState(() {
      selectedTabIndex = i;
    });
  }
}
