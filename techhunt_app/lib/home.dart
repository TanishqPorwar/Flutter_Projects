import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: FaIcon(FontAwesomeIcons.questionCircle),
              onPressed: () {
                showAlertDialog(context);
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
          child: ListView(
            children: <Widget>[
              Text(
                "goo.gl/",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 50, right: 50),
                child: PinCodeTextField(
                  length: 6,
                  onChanged: (value) {
                    print(value);
                  },
                  backgroundColor: Color(0x01),
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Link Broken?"),
        content: RichText(
          text: TextSpan(
            text: "What's left ",
            style: TextStyle(fontSize: 20),
            children: <TextSpan>[
              TextSpan(
                text: "unsaid ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: "says it "),
              TextSpan(
                text: "alls.",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        contentPadding: EdgeInsets.all(25.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        actions: <Widget>[
          FlatButton(onPressed: () {}, child: Text("ok")),
        ],
      );
    },
  );
}
