import 'package:flutter/material.dart';
import 'package:game_message_ui/src/common/forum_card.dart';
import 'package:game_message_ui/src/common/tab_text.dart';
import 'package:game_message_ui/src/model/forum.dart';
import 'package:game_message_ui/src/style/test_style.dart';

class HorizontalTabLayout extends StatefulWidget {
  @override
  _HorizontalTabLayoutState createState() => _HorizontalTabLayoutState();
}

class _HorizontalTabLayoutState extends State<HorizontalTabLayout>
    with SingleTickerProviderStateMixin {
  int selectedTabIndex = 2;
  AnimationController _controller;
  Animation<double> _fadeAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(-0.05, 0))
        .animate(_controller);
    _controller.forward();
  }

  playAnimation() {
    _controller.reset();
    _controller.forward();
  }

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
            child: FutureBuilder(
              future: playAnimation(),
              builder: (context, snapshot) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: getList(selectedTabIndex),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getList(int index) {
    return {
      0: [
        ForumCard(forum: fortniteForum),
        ForumCard(forum: pubgForum),
      ],
      1: [
        ForumCard(forum: pubgForum),
        ForumCard(forum: fortniteForum),
      ],
      2: [
        ForumCard(forum: fortniteForum),
        ForumCard(forum: pubgForum),
      ],
    }[index];
  }

  onTabTap(int i) {
    setState(() {
      selectedTabIndex = i;
    });
  }
}
