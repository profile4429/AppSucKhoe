import 'package:flutter/material.dart';
import 'package:flutter_mental_health/constants.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textController;
  bool readOnly = false;
  var hinText;
  Color bgColor = Colors.transparent;
  Color TextColor = greyColor;
  final String text;
  final Function(String) onTextChanged;
  TextFieldInput(
      {this.hinText,
      this.readOnly= false,
      this.bgColor = Colors.transparent,
      this.TextColor=greyColor,
      required this.text,
      required this.onTextChanged,
      required this.textController});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(borderRadius)),
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      child: TextField(
        onChanged: (value) {
          onTextChanged(value);
        },
        controller: textController,
        readOnly: readOnly,
        cursorColor: blackColor,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(borderRadius)),
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            hintText: hinText,
            hintStyle: TextStyle(color: TextColor)),
      ),
    );
  }
}
