import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:game_message_ui/src/common/forum_card.dart';
import 'package:game_message_ui/src/common/tab_text.dart';
import 'package:game_message_ui/src/model/forum.dart';
import 'package:game_message_ui/src/services/firebase_service.dart';

class HorizontalTabLayout extends StatefulWidget {
  final FirebaseService firebaseService;

  const HorizontalTabLayout({Key key, this.firebaseService}) : super(key: key);
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
                    child: StreamBuilder(
                        stream: widget.firebaseService
                            .getList(getTypeFromIndex(selectedTabIndex)),
                        builder: (context, ayncsnapshot) {
                          if (ayncsnapshot.hasError) {
                            return Center(child: Text("Error"));
                          }
                          switch (ayncsnapshot.connectionState) {
                            case ConnectionState.waiting:
                              return CircularProgressIndicator();
                              break;
                            default:
                              return _buildList(context, ayncsnapshot);
                          }
                        }),
                  ),
                );
              },
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

  String getTypeFromIndex(int selectedTabIndex) {
    switch (selectedTabIndex) {
      case 2:
        return "forum";
      case 1:
        return "streamers";
      case 0:
        return "media";
    }
  }

  Widget _buildList(
      BuildContext context, AsyncSnapshot<QuerySnapshot> ayncsnapshot) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: ayncsnapshot.data.documents.length,
      itemBuilder: (context, index) {
        return ForumCard(
          forum:
              Forum.fromSnapshot(ayncsnapshot.data.documents.elementAt(index)),
        );
      },
    );
  }
}
