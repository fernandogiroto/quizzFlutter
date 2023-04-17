import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playNote(note) async {
    final player = AudioPlayer();
    await player.play(AssetSource('sounds/$note.wav'));
  }

  Expanded buildKey({required String note, required Color color, required String noteName}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playNote(note);
        },
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        ),
        child: Text(
          '$noteName #',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(note: 'note1', color: Colors.red, noteName: 'Dó'),
              buildKey(note: 'note2', color: Colors.yellow, noteName: 'Ré'),
              buildKey(note: 'note3', color: Colors.blue, noteName: 'Mi'),
              buildKey(note: 'note4', color: Colors.green, noteName: 'Fá'),
              buildKey(note: 'note5', color: Colors.teal, noteName: 'Só'),
              buildKey(note: 'note6', color: Colors.purple, noteName: 'Lá'),
              buildKey(note: 'note7', color: Colors.orange, noteName: 'Sí'),
            ],
          ),
        ),
      ),
    );
  }
}
