import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mental_health/components/text_field_input.dart';
import 'package:flutter_mental_health/constants.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  final Function(DateTime) onDateChanged;
  final DateTime date;
  const DatePickerWidget(
      {Key? key, required this.onDateChanged, required this.date})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DateTimePickerState();
  }
}

class DateTimePickerState extends State<DatePickerWidget> {
  final controller = TextEditingController();
  //convert date to string
  String getText() {
    if (widget.date == null) {
      return 'Select Date';
    } else {
      return DateFormat('yyyy/MM/dd').format(widget.date);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius)),
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      child: TextField(
        readOnly: true,
        onTap: () => pickdate(context),
        enabled: true,
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
            hintText:
                widget.date == DateTime.now() ? "Date of birth" : getText(),
            hintStyle: TextStyle(color: greyColor)),
      ),
    ));
  }

  //show pickdatetime dialog
  Future pickdate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1979),
        lastDate: DateTime.now());
    if (newDate == null)
      return;
    else {
      widget.onDateChanged(newDate);
    }
  }
}
