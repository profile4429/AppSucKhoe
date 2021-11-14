import 'package:flutter/material.dart';
import 'package:flutter_mental_health/constants.dart';

class LabelText extends StatelessWidget {
  var name;
  var selector = "";

  var activeColor = linkColor;
  LabelText({Key? key, this.name="", this.selector = ""}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(name,
          style: const TextStyle(
              fontFamily: textFont,
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: blackColor)),
      Text(selector,
          style: TextStyle(
            fontFamily: textFont,
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            color: activeColor,
          ))
    ]);
  }
}
