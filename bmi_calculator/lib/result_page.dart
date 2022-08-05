import 'package:bmi_calculator/reusableCard.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'largeEndButton.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(ScreenArguments arg) {
    this.label = arg.label;
    this.bmi = arg.bmi;
  }

  String label = "normal";
  //"underweight";
  String bmi = "23.0";
  static const routeName = '/result';

  Text bmi_label(String label) {
    return Text(
      label.toUpperCase(),
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: bmi_range_color[label],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //"0";
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("BMI RESULT")),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 25),
              child: Text("Your Result", style: kLabelTextStyle2),
              alignment: Alignment.bottomCenter,
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      bmi_label(label),
                      Text(bmi, style: kLargeNumberTextStyle),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              bmi_range_text[label]!,
                              style: kLabelTextStyle,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              bmi_range_number[label]!,
                              style: kLabelTextStyle_white_shade,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {
                            print("resuts shoudl be saved");
                          },
                          child: Text("SAVE RESULT",
                              style: kLabelTextStyle_white_shade),
                        ),
                        color: kInactiveCardColor,
                        margin: EdgeInsets.all(50),
                        width: double.infinity,
                        height: kBottomContainerHeight,
                      )
                    ]),
              ),
            ),
            LargeEndButton(
                text: "Re-CALCULATE YOUR BMI", output: "/", details: {}),
          ],
        ));
  }
}
