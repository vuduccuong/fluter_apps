import 'package:flutter/material.dart';

void main() async {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[200],
          title: const Text("I Am Poor"),
        ),
        body: const Center(
          child: Image(
            image: AssetImage("images/i_am_poor_icon.png"),
          ),
        ),
      )
    )
  );
}
