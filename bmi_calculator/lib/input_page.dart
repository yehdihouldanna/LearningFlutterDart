import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'reusableCard.dart';
import 'genderCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'largeEndButton.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender activeGender = Gender.male;
  int height = 186;
  int weight = 70;

  var details = {'height': 186, 'weight': 70, 'age': 19};
  //

  void updateColor(Gender selectedGender) {
    activeGender = selectedGender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                    color: activeGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild:
                        genderCard(icon: FontAwesomeIcons.mars, text: "MALE"),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () => {
                      setState(() {
                        updateColor(Gender.female);
                      })
                    },
                    color: activeGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: genderCard(
                        icon: FontAwesomeIcons.venus, text: "FEMALE"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT', style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(details['height'].toString(),
                            style: kNumberTextStyle),
                        Text('cm', style: kLabelTextStyle),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 25),
                        overlayColor: Color(0x235FEB1555),
                      ),
                      child: Slider(
                          min: 101,
                          max: 220,
                          value: details['height']!.toDouble(),
                          onChanged: (value) => {
                                setState(() {
                                  details['height'] = value.round();
                                })
                              }),
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  color: kActiveCardColor,
                  cardChild: ModifiableValueCard(
                      parent: this, title: "WEIGHT", name: "weight"),
                )),
                Expanded(
                    child: ReusableCard(
                  color: kActiveCardColor,
                  cardChild: ModifiableValueCard(
                      parent: this, title: "AGE", name: "age"),
                )),
              ],
            ),
          ),
          LargeEndButton(
              text: "CALCUALATE YOUR BMI",
              output: '/result',
              details: this.details),
        ],
      ),
    );
  }

  Column ModifiableValueCard(
      {required _InputPageState parent,
      required String title,
      required String name}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: kLabelTextStyle),
        Text(parent.details[name].toString(), style: kNumberTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              icon: Icons.add,
              onPressed: () {
                parent.setState(() {
                  parent.details[name] = parent.details[name]! + 1;
                });
              },
            ),
            SizedBox(
              width: 10,
            ),
            RoundIconButton(
              icon: Icons.remove,
              onPressed: () {
                setState(() {
                  parent.details[name] = parent.details[name]! - 1;
                });
              },
            )
          ],
        )
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.onPressed, this.icon});
  final IconData? icon;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        size: 35,
        icon,
      ),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      elevation: 0,
    );
  }
}
