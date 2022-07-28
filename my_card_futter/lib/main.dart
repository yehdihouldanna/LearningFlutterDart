import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var colors = [
    Colors.white,
    Colors.amber.shade900,
    Colors.amber.shade100,
  ];
  // var colors = [
  //   Colors.white,
  //   Colors.teal,
  //   Colors.teal.shade100,
  // ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: colors[1],
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/avatar_.jpg'),
            ),
            Text(
              'Yehdhih Anna',
              style: TextStyle(
                fontSize: 40,
                color: colors[0],
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontFamily: 'Merienda',
              ),
            ),
            Text(
              'Machine Learning engineeer',
              style: TextStyle(
                fontSize: 20,
                color: colors[2],
                // fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                fontFamily: 'Source Sans Pro',
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: Text(
                'You friendly neighborhood\'s AI engineer, and software developper',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  color: colors[2],
                  // fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontFamily: 'Source Sans Pro',
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(color: colors[2]),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(Icons.phone, size: 30, color: colors[1]),
                    title: Text(
                      '+222 12 34 56 78',
                      style: TextStyle(
                        color: colors[1],
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(Icons.email, size: 30, color: colors[1]),
                    title: Text(
                      'yehdihouldanna@gmail.com',
                      style: TextStyle(
                        color: colors[1],
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ),
          ],
        )),
      ),
    );
  }
}
