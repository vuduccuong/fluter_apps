import 'package:flutter/material.dart';

void main() async {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber[300],
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("I Am Rich"),
        ),
        body: const Center(
          child: Image(
            image: AssetImage('images/diamond.png'),
          ),
        ),
      ),
    ),
  );
}
