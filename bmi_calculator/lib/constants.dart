import 'package:flutter/material.dart';

const TextStyle kLabelTextStyle = TextStyle(
    fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF8D8E98));
const TextStyle kLabelTextStyle_white_shade = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 255, 254, 255));

const TextStyle kNumberTextStyle =
    TextStyle(fontSize: 50, fontWeight: FontWeight.w900);
const TextStyle kLargeNumberTextStyle =
    TextStyle(fontSize: 100, fontWeight: FontWeight.w900);

const TextStyle kLabelTextStyle2 =
    TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white);

const TextStyle kLabelTextStyle_green = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: Colors.green,
);

const double kBottomContainerHeight = 80;
const Color kBottomContainerColor = Color(0xFFEB1555);
const Color kActiveCardColor = Color(0xFF1D1E33);
const Color kInactiveCardColor = Color(0xFF111328);

const Map<String, String> bmi_range_text = {
  "underweight": "Underweight BMI range:",
  "normal": "Normal BMI range:",
  "overweight": "Overweight BMI range",
  "obese": "Obese BMI range",
  "extremly obese": "Extreme obese BMI range"
};
const Map<String, String> bmi_range_number = {
  "underweight": "BMI < 18,5",
  "normal": "18,5 < BMI < 24,9",
  "overweight": "25 < BMI < 29,9",
  "obese": "30 < BMI < 34,9",
  "extremly obese": "35 < BMI"
};

const Map<String, Color> bmi_range_color = {
  "underweight": Colors.blue,
  "normal": Colors.green,
  "overweight": Colors.yellow,
  "obese": Colors.orange,
  "extremly obese": Colors.red,
};

class ScreenArguments {
  final String bmi;
  final String label;

  ScreenArguments(this.bmi, this.label);
}
