import 'package:flutter/material.dart';
import 'constants.dart';

class genderCard extends StatelessWidget {
  genderCard({this.icon, this.text = ""});
  final IconData? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        icon,
        size: 80.0,
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        text,
        style: kLabelTextStyle,
      ),
    ]);
  }
}
