import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepOrange[100],
        appBar: AppBar(
          title: Center(
            child: Text('I Am Rich'),
            ),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Image(
            // image: NetworkImage('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
            image : AssetImage('images/diamond.gif'),
          ),
        ),
      ),
    ),
  );
}
