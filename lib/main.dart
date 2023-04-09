import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  void playSound(int soundNumber) async{
    final player = AudioPlayer();
    await player.setSource(AssetSource('note$soundNumber.wav'));
    await player.resume();
  }

 Expanded createKeys({Color color, int soundNumber}){
   return Expanded(
     child: TextButton(
       style: TextButton.styleFrom(
         backgroundColor: color,
       ),
       onPressed: () async {
         playSound(soundNumber);
       },
     ),
   );
 }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              createKeys(color: Colors.red, soundNumber: 1),
              createKeys(color: Colors.orange, soundNumber: 2),
              createKeys(color: Colors.yellow, soundNumber: 3),
              createKeys(color: Colors.green, soundNumber: 4),
              createKeys(color: Colors.blue, soundNumber: 5),
              createKeys(color: Colors.indigo, soundNumber: 6),
              createKeys(color: Colors.purple, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
