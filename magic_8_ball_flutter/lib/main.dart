import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text("Magic Ball")),
          backgroundColor: Colors.white70,
        ),
        body: MagicBall(),
      ),
    ),
  );
}

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ball = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Image.asset('images/ball$ball.png'),
        onPressed: () {
          setState(() {
            ball = Random().nextInt(5) + 1;
          });
        },
      ),
    );
  }
}
