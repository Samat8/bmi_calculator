import 'dart:math';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/round_icon_button.dart';
import '../components/icon_content.dart';
import 'package:bmi_calculator/calculator_brain.dart';

//for Button of gender choise
enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 170;
  int weight = 60;
  int age = 20;

  // Color maleCardColor = DesignColors.inactiveColor;
  // Color femaleCardColor = DesignColors.inactiveColor;

  // void updateColor(Gender selectedGender) {

  // if (selectedGender == Gender.male) {
  //   if (maleCardColor == DesignColors.inactiveColor) {
  //     maleCardColor = DesignColors.activeColor;
  //     femaleCardColor = DesignColors.inactiveColor;
  //   } else {
  //     maleCardColor = DesignColors.inactiveColor;
  //   }
  // }
  // if (selectedGender == Gender.female) {
  //   if (femaleCardColor == DesignColors.inactiveColor) {
  //     femaleCardColor = DesignColors.activeColor;
  //     maleCardColor = DesignColors.inactiveColor;
  //   } else {
  //     femaleCardColor = DesignColors.inactiveColor;
  //   }
  // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  onPress: () => setState(() {
                    selectedGender = Gender.male;
                  }),
                  color: selectedGender == Gender.male
                      ? DesignColors.activeColor
                      : DesignColors.inactiveColor,
                  cardChild: const IconContent(
                    label: 'MALE',
                    icon: FontAwesomeIcons.mars,
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  onPress: () => setState(() {
                    selectedGender = Gender.female;
                  }),
                  color: selectedGender == Gender.female
                      ? DesignColors.activeColor
                      : DesignColors.inactiveColor,
                  cardChild: const IconContent(
                    label: 'FEMALE',
                    icon: FontAwesomeIcons.venus,
                  ),
                ))
              ],
            )),
            Expanded(
                child: ReusableCard(
              color: DesignColors.activeColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      overlayColor: Color(0x15EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        thumbColor: Color(0xFFEB1555),
                        activeColor: Color.fromARGB(255, 210, 206, 206),
                        inactiveColor: Color.fromARGB(255, 136, 136, 144),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  color: DesignColors.activeColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  color: DesignColors.activeColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
              ],
            )),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc = CalculatorBrain(
                    height: height,
                    weight: weight,
                    bmi: weight / pow(height / 100, 2));

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiResult: calc.calculateBMI(),
                              interpretation: calc.gerInterpretation(),
                              resultText: calc.getResult(),
                            )));
              },
            )
          ],
        ));
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({required this.buttonTitle, required this.onTap});

  final VoidCallback onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: const Color(0xFFEB1555),
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80.0,
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
