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
            image: NetworkImage(
              "https://imgv3.fotor.com/images/slider-image/A-blurry-image-of-a-woman-wearing-red.jpg",
            ),
          ),
        ),
      ),
    ),
  );
}
