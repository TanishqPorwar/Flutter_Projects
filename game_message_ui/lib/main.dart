import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_message_ui/src/pages/landing_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      theme: ThemeData(),
      home: LandingPage(),
    );
  }
}
