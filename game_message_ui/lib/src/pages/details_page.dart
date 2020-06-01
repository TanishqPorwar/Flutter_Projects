import 'package:flutter/material.dart';
import 'package:game_message_ui/src/common/app_background.dart';
import 'package:game_message_ui/src/common/label_value_widget.dart';
import 'package:game_message_ui/src/model/forum.dart';
import 'package:game_message_ui/src/model/topics.dart';
import 'package:game_message_ui/src/style/colors.dart';
import 'package:game_message_ui/src/style/test_style.dart';

class DetailsPage extends StatefulWidget {
  final Forum forum;

  const DetailsPage({Key key, this.forum}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> fadeAnimation;
  Animation<double> scaleAnimation;
  Animation<Offset> slideAnimation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    scaleAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    slideAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.decelerate));
  }

  playAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(
            backgroundColor: primaryColor,
            firstCircleColor: firstOrangeCircleColor,
            secondCircleColor: secondOrangeCircleColor,
            thirdCircleColor: thirdOrangeCircleColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              IconButton(
                padding: const EdgeInsets.only(left: 20.0),
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 40,
              ),
              FutureBuilder(
                future: playAnimation(),
                builder: (context, snapshot) {
                  return FadeTransition(
                    opacity: fadeAnimation,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 100),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          LabelValueWidget(
                            value: widget.forum.topics.length.toString(),
                            label: "topics",
                            labelStyle: whiteLabelTextStyle,
                            valueStyle: whiteValueTextStyle,
                          ),
                          LabelValueWidget(
                            value: widget.forum.threads,
                            label: "threads",
                            labelStyle: whiteLabelTextStyle,
                            valueStyle: whiteValueTextStyle,
                          ),
                          LabelValueWidget(
                            value: widget.forum.subs,
                            label: "subs",
                            labelStyle: whiteLabelTextStyle,
                            valueStyle: whiteValueTextStyle,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              Hero(
                tag: widget.forum.title,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
                  child: Image.asset(widget.forum.imagePath),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
              child: Container(
                height: 300,
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 40.0, left: 20, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Topic",
                        style: subHeadingStyle.copyWith(fontSize: 26),
                      ),
                      Expanded(
                        child: SlideTransition(
                          position: slideAnimation,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.forum.topics.length,
                            itemBuilder: (context, index) {
                              return TopicsTile(
                                  topic: widget.forum.topics[index]);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 260,
            right: 20,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Material(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    widget.forum.rank,
                    style: rankBigStyle,
                  ),
                ),
                shape: CircleBorder(),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopicsTile extends StatelessWidget {
  final Topic topic;

  const TopicsTile({Key key, this.topic}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                topic.question,
                style: topicQuestionTextStyle,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: primaryColor),
                child: Text(
                  topic.answerCount,
                  style: topicAnswerCountTextStyle,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: Text(
              topic.recentAnswer,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: topicAnswerTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
