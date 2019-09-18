import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
        backgroundColor: Colors.black,
      ),
      body: HomePage(),
    ),
  ),
  );

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  // gameState is the current state of the game
  var gameState = ['images/empty.png',
              'images/empty.png',
              'images/empty.png',
              'images/empty.png',
              'images/empty.png',
              'images/empty.png',
              'images/empty.png',
              'images/empty.png',
              'images/empty.png'];

  // to toggle b/w X & O
  var i = 0;

  //stores the result of the game
  var result = "";

  // to change the color after the result is obtained
  var color1 = [Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white];


  // to reset the game to initial condition after the game finishes
  reset(){
    gameState = ['images/empty.png',
              'images/empty.png',
              'images/empty.png',
              'images/empty.png',
              'images/empty.png',
              'images/empty.png',
              'images/empty.png',
              'images/empty.png',
              'images/empty.png'];
  i = 0;
   color1 = [Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white];
    result = "";
  }

  // to decide who wins
  winner(int index){
    if(index==9){
      result = "Draw!!!";
    }
    else if (gameState[index]=='images/x.png') {
          result = "X Wins!!";
        } else {
          result = "O wins!!";
        }
  }

  // to check if the game is finished
  checkWin() {
    if ((gameState[0] != 'images/empty.png') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        color1[0]= Colors.teal;
        color1[1]= Colors.teal;
        color1[2]= Colors.teal;
        
        winner(0);

        Future.delayed(const Duration(milliseconds: 2000), () {
          setState(() {
           reset(); 
          });
        });
      });
    } else if ((gameState[3] != 'images/empty.png') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        color1[3]= Colors.teal;
        color1[4]= Colors.teal;
        color1[5]= Colors.teal;
        winner(3);

        Future.delayed(const Duration(milliseconds: 2000), () {
          setState(() {
           reset(); 
          });
        });
      });
    } else if ((gameState[6] != 'images/empty.png') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
      color1[6]= Colors.teal;
      color1[7]= Colors.teal;
      color1[8]= Colors.teal;
      winner(6);

        Future.delayed(const Duration(milliseconds: 2000), () {
          setState(() {
           reset(); 
          });
        });
      });
    } else if ((gameState[0] != 'images/empty.png') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
       color1[0]= Colors.teal;
        color1[3]= Colors.teal;
        color1[6]= Colors.teal;
        winner(0);

        Future.delayed(const Duration(milliseconds: 2000), () {
          setState(() {
           reset(); 
          });
        });
      });
    } else if ((gameState[1] != 'images/empty.png') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
       color1[1]= Colors.teal;
        color1[4]= Colors.teal;
        color1[7]= Colors.teal;
        winner(1);

        Future.delayed(const Duration(milliseconds: 2000), () {
          setState(() {
           reset(); 
          });
        });
      });
    } else if ((gameState[2] != 'images/empty.png') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        color1[2]= Colors.teal;
        color1[5]= Colors.teal;
        color1[8]= Colors.teal;
        winner(2);

        Future.delayed(const Duration(milliseconds: 2000), () {
          setState(() {
           reset(); 
          });
        });
      });
    } else if ((gameState[0] != 'images/empty.png') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
       color1[0]= Colors.teal;
        color1[4]= Colors.teal;
        color1[8]= Colors.teal;
        winner(0);

        Future.delayed(const Duration(milliseconds: 2000), () {
          setState(() {
           reset(); 
          });
        });
      });
    } else if ((gameState[2] != 'images/empty.png') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        color1[2]= Colors.teal;
        color1[4]= Colors.teal;
        color1[6]= Colors.teal;
        winner(2);

        Future.delayed(const Duration(milliseconds: 2000), () {
          setState(() {
           reset(); 
          });
        });
      });
    } else if (!gameState.contains('images/empty.png')) {
      setState(() {
        color1 = [Colors.red,
                Colors.red,
                Colors.red,
                Colors.red,
                Colors.red,
                Colors.red,
                Colors.red,
                Colors.red,
                Colors.red];
        winner(9);

        Future.delayed(const Duration(milliseconds: 2000), () {
          setState(() {
           reset(); 
          });
        });
      });
    }
  }

  // to toggle b/w X and O img
  void xox(int index){
    if(gameState[index]=='images/empty.png'){
      if (i%2==0) {
      gameState[index]='images/x.png';
      print(gameState[index]);
    } else {
      gameState[index]='images/o.png';
    }
    i=i+1;
    checkWin();
    }
  }


  @override
  Widget build(BuildContext context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 Text(
                      result,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 70,
                      ),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                Row(
                  children: <Widget>[
                    Container(
                        width: 100,
                        height: 100,
                        child: FlatButton(
                          onPressed: (){
                            setState(() {
                              xox(0);
                              });
                          },
                          color: color1[0],
                      child: Image.asset(gameState[0]),
                      ),
                  ),
                  Container(
                    height: 100,
                    width: 10,
                    color: Colors.yellow,
                  ),
                 Container(
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      onPressed: (){
                        setState(() {
                          xox(1);
                          });
                      },
                      color: color1[1],
                      child: Image.asset(gameState[1]),
                      ),
                  ),
                  Container(
                    height: 100,
                    width: 10,
                    color: Colors.yellow,
                  ),
                 Container(
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      onPressed: (){
                        setState(() {
                          xox(2);
                          });
                      },
                      color: color1[2],
                      child: Image.asset(gameState[2]),
                      ),
                  ),
              ],
            ),
            Container(
                    height: 10,
                    width: 300,
                    color: Colors.yellow,
                  ),
             Row(
              children: <Widget>[
                Container(
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      onPressed: (){
                        setState(() {
                          xox(3);
                          });
                      },
                      color: color1[3],
                      child: Image.asset(gameState[3]),
                      ),
                  ),
                  Container(
                    height: 100,
                    width: 10,
                    color: Colors.yellow,
                  ),
                 Container(
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      onPressed: (){
                        setState(() {
                          xox(4);
                          });
                      },
                      color: color1[4],
                      child: Image.asset(gameState[4]),
                      ),
                  ),
                  Container(
                    height: 100,
                    width: 10,
                    color: Colors.yellow,
                  ),
                 Container(
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      onPressed: (){
                        setState(() {
                          xox(5);
                          });
                      },
                      color: color1[5],
                      child: Image.asset(gameState[5]),
                      ),
                  ),
              ],
            ),
            Container(
                    height: 10,
                    width: 300,
                    color: Colors.yellow,
                  ),
             Row(
              children: <Widget>[
                Container(
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      onPressed: (){
                        setState(() {
                          xox(6);
                          });
                      },
                      color: color1[6],
                      child: Image.asset(gameState[6]),
                      ),
                  ),
                  Container(
                    height: 100,
                    width: 10,
                    color: Colors.yellow,
                  ),
                 Container(
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      onPressed: (){
                        setState(() {
                          xox(7);
                          });
                      },
                      color: color1[7],
                      child: Image.asset(gameState[7]),
                      ),
                  ),
                  Container(
                    height: 100,
                    width: 10,
                    color: Colors.yellow,
                  ),
                 Container(
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      onPressed: (){
                        setState(() {
                          xox(8);
                          });
                      },
                      color: color1[8],
                      child: Image.asset(gameState[8]),
                      ),
                  ),
              ],
            )
          ],
        ),
      ],
    );
  }
}


