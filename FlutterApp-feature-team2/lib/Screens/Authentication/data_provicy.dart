import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_mental_health/components/rounded_button.dart';
import 'package:flutter_mental_health/constants.dart';

class DataPolicy extends StatelessWidget {
  final String mdFileName;
 
  const DataPolicy({Key? key, required this.mdFileName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: Future.delayed(const Duration(milliseconds: 150)).then((value) {
                  return rootBundle.loadString('assets/documents/$mdFileName');
                }),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Markdown(
                      data: snapshot.data.toString(),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RoundedButton(
                        btnWidth: 150,
                        name: "Ok",
                        bgColor: Colors.transparent,
                        textColor: linkColor,
                        press: () => {Navigator.of(context).pop()}),
                  ]),
            )
          ],
        ),
      ),
    ));
  }
}
