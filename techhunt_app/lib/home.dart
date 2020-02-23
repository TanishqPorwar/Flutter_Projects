import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
        padding:
            const EdgeInsets.only(top: 50, right: 10, left: 15, bottom: 10),
        child: Container(
          child: ListView(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: "Welcome! \n",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            "So, you've made it this far. You'll find what you need here👇",
                        style: TextStyle(fontSize: 25))
                  ],
                ),
              ),
              Text(
                "\ngoo.gl/",
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
                    if (value == "linked") {
                      print(value);
                      setState(() {
                        check = true;
                      });
                    } else {
                      setState(() {
                        check = false;
                        print(check);
                      });
                    }
                  },
                  backgroundColor: Color(0x01),
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 80),
                child: RaisedButton(
                    child: Text("GOTO"),
                    onPressed: check
                        ? () async {
                            const url = 'https://flutter.dev';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          }
                        : () {
                            final snackBar = SnackBar(
                              backgroundColor:
                                  Theme.of(context).primaryColorDark,
                              content: Text(
                                'opps!! looks like the link is broken',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColorLight),
                              ),
                              action: SnackBarAction(
                                label: 'Ok',
                                textColor: Theme.of(context).accentColor,
                                onPressed: () {},
                              ),
                            );
                            _scaffoldKey.currentState.showSnackBar(snackBar);
                          }),
              )
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
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
              TextSpan(text: "says it "),
              TextSpan(
                text: "all.",
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
        contentPadding: EdgeInsets.all(25.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () =>
                  Navigator.of(context, rootNavigator: true).pop('dialog'),
              child: Text("ok")),
        ],
      );
    },
  );
}
