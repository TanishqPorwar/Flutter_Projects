import 'package:flutter/material.dart';
import 'button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  /// Variable to store the email id
  String _emailid;

  /// Variable to store the password
  String _password;

  /// The key for the form
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
      color: Colors.transparent,
      height: double.infinity,
      alignment: Alignment.center,
      // wrapping the tfs and button in a scroll view
      // so that we can scroll when the keyboard is open
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign In',
              style: Theme.of(context).textTheme.title,
            ),

            // gap
            SizedBox(height: 30.0),

            // the form
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  _buildEmailTF(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildPasswordTF()
                ],
              ),
            ),

            // gap
            SizedBox(
              height: 30,
            ),

            // build forgot password and login
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // login button
                Flexible(
                  child: BuildButton(
                      data: "LOGIN",
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      onPressed: () {}),
                ),
              ],
            ),
            // gap
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    )
    );
  }

  // building the email textfield(tf)
  Widget _buildEmailTF() {
    return Container(
      decoration: BoxDecoration(
        // to get a curved border
        borderRadius: BorderRadius.circular(10.0),
        // to give a shadow to the tf
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        enabled: false,
        style: Theme.of(context).textTheme.subhead,
        textAlign: TextAlign.left,
        keyboardType: TextInputType.emailAddress,
        decoration: TextFormFieldPrefix(
            hintText: "~/\$ admin",
            icon: FaIcon(FontAwesomeIcons.userCog)
            ).copyWith(hintStyle: TextStyle(
              color: Colors.black
            )),
        onSaved: (String value) => _emailid = value,
      ),
    );
  }

  // building the password tf
  Widget _buildPasswordTF() {
    return Container(
      decoration: BoxDecoration(
        // to get a curved border
        borderRadius: BorderRadius.circular(10.0),
        // to give a shadow to the tf
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        obscureText: true,
        style: TextStyle(fontFamily: "hack"),
        decoration: TextFormFieldPrefix(
            hintText: "Enter Password",
            icon: FaIcon(FontAwesomeIcons.key)
            ),
        onSaved: (String value) => _password = value,
      ),
    );
  }
}

class TextFormFieldPrefix extends InputDecoration {
  TextFormFieldPrefix({
    @required String hintText,
    @required Widget icon,
    Color color = const Color(0xff2F3857),
    double topLeftRadius = 10,
    double bottomLeftRadius = 10,
  }) : super(
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: "hack"
            ),
            prefixIcon: Container(
              decoration: BoxDecoration(
                  color: Color(0xff2F3857),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  )),
              child: Padding(padding: EdgeInsets.only(left:10,top:10),child: icon,),
            ),
            prefix: SizedBox(
              width: 10,
            ));
}
