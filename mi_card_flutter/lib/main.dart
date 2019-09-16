import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp()
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage ('images/panda.png'),
              ),
              Text(
                'Tanishq Porwar',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),               
              ),
              Text(
                'Flutter Developer',
                style: TextStyle(
                  fontFamily: 'SSpro',
                  fontSize: 30,
                  color: Colors.teal[100],
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Colors.tealAccent[100],
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25) ,
                child: ListTile(
                  leading: Icon(
                        Icons.call,
                        color: Colors.teal,
                        ),
                  title: Text(
                          '+91 91480 71780',
                          style: TextStyle(
                            color: Colors.teal[900],
                            fontFamily: 'SSpro',
                            fontSize: 20,
                          ),
                        ),
                )
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                        Icons.email,
                        color: Colors.teal,
                      ),
                  title: Text(
                        'Me@email.com',
                        style: TextStyle(
                          fontFamily: 'SSpro',
                          color: Colors.teal[900],
                          fontSize: 20,
                        ),
                      )
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}






