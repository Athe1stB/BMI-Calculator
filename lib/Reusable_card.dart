import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  final Color bgColor;
  final Widget cardChild;

  ReusableCard({@required this.bgColor, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(16),
      decoration:
          BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(8)),
    );
  }
}
