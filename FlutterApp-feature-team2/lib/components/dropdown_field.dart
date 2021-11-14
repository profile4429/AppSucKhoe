import 'package:flutter/material.dart';
import 'package:flutter_mental_health/constants.dart';

class MyDropDown extends StatefulWidget {
  String gender;
  Function(String) OnDropdownItemChanged;
  MyDropDown({required this.gender, required this.OnDropdownItemChanged});

  @override
  State<StatefulWidget> createState() {
    return _MyDropDownState();
  }
}

class _MyDropDownState extends State<MyDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: const BorderRadius.all(Radius.circular(borderRadius))),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButton<String>(
          isExpanded: true,
          value: widget.gender,
          icon: const Icon(Icons.keyboard_arrow_down_sharp),
          iconSize: 40,
          elevation: 16,
          style: const TextStyle(color: borderColor),
          onChanged: (String? newValue) {
            widget.OnDropdownItemChanged(newValue!);
          },
          items: <String>['Males', 'Females', 'Others']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
              ),
            );
          }).toList()),
    );
  }
}
