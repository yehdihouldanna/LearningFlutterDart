import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  Color? color = Colors.white;
  String? title = "";
  String? redirectToScreen;
  final VoidCallback onPressed;
  RoundedButton({
    Key? key,
    this.color,
    this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color!,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 70.0,
          child: Text(
            title!,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
