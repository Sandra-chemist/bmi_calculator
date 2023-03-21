import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const inactiveCarColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCarColour;
  Color femaleCardColour = inactiveCarColour;

  //1 = male, 2 = female
  void updateColour(int gender) {
    if (gender == 1) {
      if (maleCardColour == inactiveCarColour) {
        maleCardColour = activeCardColour;
        femaleCardColour = inactiveCarColour;
      } else {
        maleCardColour = inactiveCarColour;
      }
    }
    if (gender == 2) {
      if (femaleCardColour == inactiveCarColour) {
        femaleCardColour = activeCardColour;
        maleCardColour = inactiveCarColour;
      } else {
        femaleCardColour = inactiveCarColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(1);
                      });
                    },
                    child: ReusableCard(
                      maleCardColour,
                      IconContent(
                        FontAwesomeIcons.mars,
                        "MALE",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(2);
                      });
                    },
                    child: ReusableCard(
                      femaleCardColour,
                      IconContent(
                        FontAwesomeIcons.venus,
                        "FEMALE",
                      ),
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableCard(activeCardColour, Row()),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(activeCardColour, Column()),
                ),
                Expanded(
                  child: ReusableCard(activeCardColour, Column()),
                ),
              ],
            )),
            Container(
              color: bottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
          ],
        ));
  }
}
