import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          title:Center( child:
          Text("DICE ROLLER",style:TextStyle(
              fontSize: 40,fontFamily: "Square Peg"
          ),
          ),
          ),
          backgroundColor: Colors.purple,
        ),
        body: SafeArea(
          child: DicePage(),
        ),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 6;
  int rightDice = 6;

  int getRandomNumber() {
    Random rnd = Random.secure();
    int randomValue = rnd.nextInt(6);

    randomValue += 1;

    return randomValue;
  }

  void roll() {
    setState(() {
    leftDice = getRandomNumber();
    rightDice  = getRandomNumber();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: roll,
              child: Image.asset(
                "images/dice$leftDice.png",
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: roll,
              child: Image.asset("images/dice$rightDice.png"),
            ),
          ),
        ],
      ),
    );
  }
}