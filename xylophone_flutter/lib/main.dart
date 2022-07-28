import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  // This widget is the root of your application.
  void playSound(int note) {
    final player = AudioCache();
    player.play('note$note.wav');
  }

  Padding buildKey(
      {required Color color, required int note, required int flex_ratio}) {
    return Padding(
        padding: EdgeInsets.all(1),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: flex_ratio,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25), // <-- Radius
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        height: 15,
                        width: 15,
                        decoration: new BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ]),
                        child: SizedBox(),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        height: 15,
                        width: 15,
                        decoration: new BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ]),
                        child: SizedBox(),
                      ),
                    ],
                  ),
                  // SizedBox(),
                  onPressed: () {
                    playSound(note);
                  },
                ),
              ),
              Expanded(
                flex: 20 - flex_ratio,
                child: SizedBox(),
              ),
            ]));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.grey.shade700,
      appBar: AppBar(
        title: Center(
            child: ListTile(
          leading: Icon(Icons.music_note, size: 30, color: Colors.white),
          title: Text(
            "Xylophone Application",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )),
        backgroundColor: Colors.orange,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildKey(color: Colors.red, note: 1, flex_ratio: 6),
                buildKey(color: Colors.purple, note: 2, flex_ratio: 7),
                buildKey(color: Colors.indigo, note: 3, flex_ratio: 8),
                buildKey(color: Colors.lightBlue, note: 4, flex_ratio: 9),
                buildKey(color: Colors.teal, note: 5, flex_ratio: 10),
                buildKey(color: Colors.lightGreen, note: 6, flex_ratio: 11),
                buildKey(color: Colors.yellow, note: 7, flex_ratio: 12),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
