import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Gender_options.dart';
import 'Reusable_card.dart';
import 'results_page.dart';

const cardBgColor = Color(0xFF1D1E33);
const inactiveColor = Color(0xFF111328);
const lowerButtonHeight = 60.0;
const darkColor = Color(0xFF8D8E98);
const lightColor = Color(0xFFFFFFFF);
enum Gender {
  male,
  female,
}

enum wa {
  age,
  weight,
}

enum op {
  plus,
  minus,
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF090C21),
        scaffoldBackgroundColor: Color(0xFF090C21),
      ),
      home: DashBoard(),
    );
  }
}

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int height = 180, weight = 40, age = 17;
  Color maleCardColor = inactiveColor;
  Color maleThemeColor = darkColor;
  Color femaleCardColor = inactiveColor;
  Color femaleThemeColor = darkColor;

  void operate(wa temp, op o) {
    setState(() {
      if (temp == wa.weight) {
        weight = (o == op.minus) ? weight - 1 : weight + 1;
      } else {
        age = (o == op.minus) ? age - 1 : age + 1;
      }
    });
  }

  void changeColor(Gender gender) {
    setState(() {
      if (gender == Gender.male) {
        maleCardColor = cardBgColor;
        femaleCardColor = inactiveColor;
        maleThemeColor = lightColor;
        femaleThemeColor = darkColor;
      } else {
        maleCardColor = inactiveColor;
        femaleCardColor = cardBgColor;
        maleThemeColor = darkColor;
        femaleThemeColor = lightColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        changeColor(Gender.male);
                      },
                      child: ReusableCard(
                          bgColor: maleCardColor,
                          cardChild: GenderOptions(
                            mainIcon: FontAwesomeIcons.mars,
                            mainColor: maleThemeColor,
                            label: 'MALE',
                          )),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        changeColor(Gender.female);
                      },
                      child: ReusableCard(
                        bgColor: femaleCardColor,
                        cardChild: GenderOptions(
                          mainColor: femaleThemeColor,
                          mainIcon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                bgColor: cardBgColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(color: darkColor, fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: lightColor),
                        ),
                        Text(
                          'cm',
                          style: TextStyle(color: darkColor, fontSize: 18),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayColor: Colors.pink.shade200,
                          activeTrackColor: lightColor,
                          inactiveTrackColor: darkColor,
                          thumbColor: Colors.pink[700]),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      bgColor: cardBgColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(color: darkColor, fontSize: 18),
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: lightColor),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomButton(
                                icon: FontAwesomeIcons.minus,
                                temp: () {
                                  operate(wa.weight, op.minus);
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CustomButton(
                                icon: FontAwesomeIcons.plus,
                                temp: () {
                                  operate(wa.weight, op.plus);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      bgColor: cardBgColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(color: darkColor, fontSize: 18),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: lightColor),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomButton(
                                icon: FontAwesomeIcons.minus,
                                temp: () {
                                  operate(wa.age, op.minus);
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CustomButton(
                                icon: FontAwesomeIcons.plus,
                                temp: () {
                                  operate(wa.age, op.plus);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ResultPage(height: height, weight: weight)));
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: lightColor),
                  ),
                ),
                height: lowerButtonHeight,
                color: Colors.pink[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final Function temp;
  CustomButton({this.icon, this.temp});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: lightColor,
      ),
      shape: CircleBorder(),
      onPressed: temp,
      elevation: 0,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints().tighten(width: 50, height: 50),
    );
  }
}
