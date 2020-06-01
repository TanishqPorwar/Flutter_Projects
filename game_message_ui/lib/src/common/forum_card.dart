import 'package:flutter/material.dart';
import 'package:game_message_ui/src/common/forum_details_widget.dart';
import 'package:game_message_ui/src/common/forum_name_widget.dart';
import 'package:game_message_ui/src/model/forum.dart';
import 'package:game_message_ui/src/pages/details_page.dart';

class ForumCard extends StatelessWidget {
  final Forum forum;

  const ForumCard({Key key, this.forum}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailsPage(
            forum: forum,
          ),
        ));
      },
      child: SizedBox(
        width: 280,
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 60),
          elevation: 20.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Hero(
            tag: forum.title,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    forum.imagePath,
                    width: 270.0,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: ForumDetailsWidget(forum: forum),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 70,
                    child: ForumNameWidget(forum: forum),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
