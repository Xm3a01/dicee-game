import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dicee App',
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DiceePage(),
      ),
    );
  }
}

class DiceePage extends StatefulWidget {
  @override
  _DiceePageState createState() => _DiceePageState();
}

class _DiceePageState extends State<DiceePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int leftScor = 0;
  int rightScor = 0;

  void _diceNumber() {
    var rng = new Random();
    setState(() {
      leftDiceNumber = rng.nextInt(6) + 1;
      rightDiceNumber = rng.nextInt(6) + 1;
      if (leftDiceNumber == 6) {
        leftScor += 1;
      }
      if (rightDiceNumber == 6) {
        rightScor += 1;
      }
    });
    // print(counter);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  FlatButton(
                    onPressed: _diceNumber,
                    child: Image.asset('images/dice$leftDiceNumber.png'),
                  ),
                  // SizedBox(height: 10,),
                  Text(
                    'Left Dice Scor : $leftScor',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'Pacifico'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  FlatButton(
                    onPressed: _diceNumber,
                    child: Image.asset('images/dice$rightDiceNumber.png'),
                  ),
                  // SizedBox(height: 10,),
                  Text(
                    'Right Dice Scor : $rightScor',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'Pacifico'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
