import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          leading: const Icon(Icons.accessibility),
          title: const Text("Xuc Xac"),
          backgroundColor: Colors.red[400],
        ),
        body: const DiceApp(),
      ),
    ),
  );
}

class DiceApp extends StatefulWidget {
  const DiceApp({
    super.key,
  });

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int numLeft = Random().nextInt(6) + 1;
  int numRight = Random().nextInt(6) + 1;

  void _onDice() async {
    setState(() {
      numLeft = Random().nextInt(6) + 1;
      numRight = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: _onDice,
                child: Image(
                  image: AssetImage("images/dice$numLeft.png"),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: _onDice,
                child: Image(
                  image: AssetImage("images/dice$numRight.png"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
