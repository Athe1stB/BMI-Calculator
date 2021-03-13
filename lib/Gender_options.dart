import 'package:flutter/material.dart';


class GenderOptions extends StatelessWidget {
  final IconData mainIcon;
  final Color mainColor;
  final String label;

  GenderOptions(
      {@required this.mainIcon,
      @required this.label,
      @required this.mainColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          mainIcon,
          size: 80,
          color: mainColor,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label, style: TextStyle(fontSize: 18, color: mainColor),),
      ],
    );
  }
}
