import 'dart:math';
import 'constants.dart';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});
  final int height;
  final int weight;

  Map<String, String> calculateBMI() {
    double bmi = weight / pow(height / 100, 2);
    String label = "";
    if (bmi < 18.5)
      label = "underweight";
    else if (bmi < 25)
      label = "normal";
    else if (bmi < 30)
      label = "overweight";
    else if (bmi < 35)
      label = "obese";
    else
      label = "extremely obese";

    return {'label': label, 'bmi': bmi.toStringAsFixed(1)};
  }
}
