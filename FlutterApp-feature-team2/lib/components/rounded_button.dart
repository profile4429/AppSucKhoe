import 'package:flutter/material.dart';
import 'package:flutter_mental_health/constants.dart';
import 'package:getwidget/getwidget.dart';

class RoundedButton extends StatelessWidget {
  var name;
  double marginVertical;
  double marginHozirontal;
  Color bgColor = blueColor;
  Color textColor = whiteColor;
  double btnWidth = double.infinity;
  final Function press;
  RoundedButton(
      {Key? key,
      this.name,
      this.marginHozirontal = 0,
      this.marginVertical = 0,
      this.bgColor = blueColor,
      this.textColor = whiteColor,
      this.btnWidth=double.infinity,
      required this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: this.marginVertical, horizontal: this.marginHozirontal),
      width: btnWidth,
      height: 40,
      child: GFButton(
        color: bgColor,
        text: name,
        textStyle: TextStyle(
            fontFamily: textFont,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: textColor),
        blockButton: true,
        shape: GFButtonShape.pills,
        onPressed: () {
          press();
        },
      ),
    );
  }
}
