import 'package:flutter/material.dart';
import 'package:flutter_testing/HomePage.dart';

class ResultPage extends StatefulWidget {
  final int height;
  final int weight;

  ResultPage({this.height, this.weight});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String getComment(double bmi) {
    if (bmi < 16.0)
      return 'Severe Thinness';
    else if (bmi < 17)
      return 'Moderate Thinness	';
    else if (bmi < 18.5)
      return 'Mild Thinness	';
    else if (bmi < 25)
      return 'Normal';
    else if (bmi < 30)
      return 'Overweight';
    else if (bmi < 35)
      return 'Obese Class I';
    else if (bmi < 40)
      return 'Obese Class II';
    else
      return 'Obese Class III';
  }

  @override
  Widget build(BuildContext context) {
    double height = widget.height.toDouble() / 100.0;
    double weight = widget.weight.toDouble();
    double bmi = weight / (height * height);
    String comment = getComment(bmi);

    print(height);
    print(weight);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          'Result',
          style: TextStyle(
              fontFamily: 'Pacifico', color: Colors.white, fontSize: 30),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your BMI is',
              style: TextStyle(
                  color: Colors.white30, fontFamily: 'Kanit', fontSize: 30),
            ),
            Text(
              bmi.toStringAsFixed(1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 120,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.bold),
            ),
            Text(
              comment,
              style: TextStyle(
                  color: Colors.white60,
                  fontSize: 40,
                  fontFamily: 'Kanit',
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.pink)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'RECALCULATE',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Kanit', fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
Underweight = <18.5
Normal weight = 18.5–24.9
Overweight = 25–29.9
Obesity = BMI of 30 or greater
*/