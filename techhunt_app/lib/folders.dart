import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techhunt_app/empty.dart';
import 'home.dart';

class FolderPage extends StatefulWidget {
  @override
  _FolderPageState createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildFolder(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EmptyPage()),
                        );
                      }),
                      _buildFolder(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EmptyPage()),
                        );
                      }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildFolder(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EmptyPage()),
                        );
                      }),
                      _buildFolder(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EmptyPage()),
                        );
                      }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildFolder(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      }),
                      _buildFolder(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EmptyPage()),
                        );
                      }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildFolder(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EmptyPage()),
                        );
                      }),
                      _buildFolder(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EmptyPage()),
                        );
                      }),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

Widget _buildFolder(onPressed) {
  return Column(
    children: <Widget>[
      IconButton(
        icon: FaIcon(FontAwesomeIcons.solidFolderOpen),
        onPressed: onPressed,
        color: Color(0xffF7D874),
        iconSize: 50,
      )
    ],
  );
}
