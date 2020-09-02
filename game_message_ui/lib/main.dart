import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_message_ui/src/pages/landing_page.dart';
import 'package:game_message_ui/src/services/firebase_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseService _firebaseService = FirebaseService();
    return MaterialApp(
      title: 'Chat',
      theme: ThemeData(),
      home: LandingPage(firebaseService: _firebaseService),
    );
  }
}
