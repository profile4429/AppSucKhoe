import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mental_health/constants.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class SignUpBoxes extends StatefulWidget {
  final Function(String) onTextChanged;

  const SignUpBoxes({Key? key, required this.onTextChanged}) : super(key: key);
  @override
  _SignUpBoxesState createState() => _SignUpBoxesState();
}

class _SignUpBoxesState extends State<SignUpBoxes> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return (PinCodeTextField(
      onDone: (value) {
        widget.onTextChanged(value);
      },
      maxLength: 6,
      pinBoxHeight: 45,
      pinBoxWidth: 45,
      pinBoxColor: lightblueColor,
      pinTextStyle: TextStyle(fontFamily: textFont, fontSize: 20),
      pinBoxRadius: 5,
      controller: _textEditingController,
      defaultBorderColor: Colors.transparent,
      hasTextBorderColor: Colors.transparent,
    ));
  }
}
