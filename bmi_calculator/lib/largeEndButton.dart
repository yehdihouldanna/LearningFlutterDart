import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/result_page.dart';
import 'input_page.dart';
import 'constants.dart';
import 'package:flutter/material.dart';

// TODO : remove this class and correct passing the arguments between the widgets.
class LargeEndButton extends StatelessWidget {
  const LargeEndButton(
      {required String this.text,
      required String this.output,
      required Map<String, int> this.details});
  final String output;
  final String text;
  final Map<String, int> details;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text(text, style: kLabelTextStyle2),
        onPressed: () {
          var arguments = {};
          if (output == '/result') {
            print(details);
            CalculatorBrain calc = CalculatorBrain(
                weight: details['weight']!, height: details['height']!);
            arguments = calc.calculateBMI();
            print(arguments);
            Navigator.of(context).pushNamed(output,
                arguments:
                    ScreenArguments(arguments['bmi'], arguments['label']));
          } else {
            Navigator.pushNamed(context, output);
          }
          //? Routing to the second page:
          // Navigator.pushNamed(context, output, arguments: resultat);
          // } else {

          // }
        },
      ),
      color: kBottomContainerColor,
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: kBottomContainerHeight,
    );
  }
}
