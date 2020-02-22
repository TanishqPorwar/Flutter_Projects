import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playNote(int n) {
    final player = AudioCache();
    player.play("note$n.wav");
  }

  buildKey(int n, Color c){
    return Expanded(
                child: FlatButton(
                  color: c,
                  onPressed: () {
                    playNote(n);
                  },
                  child: Container(),
                ),
              );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Center(
          child: Column(
            children: <Widget>[
              buildKey(1, Colors.red),
              buildKey(2, Colors.orange),
              buildKey(3, Colors.yellow),
              buildKey(4, Colors.green),
              buildKey(5, Colors.teal),
              buildKey(6, Colors.blue),
              buildKey(7, Colors.purple),
            ],
          ),
        )),
      ),
    );
  }
}
