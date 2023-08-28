import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(soundNumber) {
    final player = AudioPlayer();
    player.play(
      AssetSource('note$soundNumber.wav'),
      volume: 100.0,
    );
  }

  List<Expanded> buildKeys() {
    List<Expanded> res = [];
    for (var i = 0; i < 7; i++) {
      res.add(Expanded(
        child: MaterialButton(
          color: Colors.red[(i + 1) * 100],
          enableFeedback: false,
          onPressed: () {
            playSound(i + 1);
          },
        ),
      ));
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade300),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildKeys(),
          ),
        ),
      ),
    );
  }
}
