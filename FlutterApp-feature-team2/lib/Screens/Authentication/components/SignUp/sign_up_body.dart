import 'package:flutter/material.dart';
import 'package:flutter_mental_health/components/label_text.dart';
import 'package:flutter_mental_health/components/rounded_button.dart';

import '../../../../constants.dart';
import '../../data_provicy.dart';
import 'SignUpWithEmail/sign_up_email_body.dart';
import 'SignUpWithPhone/sign_up_with_phone.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: <
          Widget>[
        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RoundedButton(
                  name: "Sign up with email",
                  marginVertical: 10,
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SignUpWithEmail();
                    }));
                  }),
              RoundedButton(
                name: "Sign up with phone number",
                marginVertical: 10,
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return SignUpWithPhone();
                  }));
                },
              ),
              const SizedBox(
                height: 50,
                width: double.infinity,
              ),
              LabelText(
                  name: "By creating account, you are agreeing to our"),
              GestureDetector(
                  child: LabelText(
                      name: "",
                      selector: "Term & Conditions and Privacy Policy"),
                  onTap: () => {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return DataPolicy(
                                mdFileName: 'privacy_policy.md',
                              );
                            }),
                      })
            ],
          ),
        ),
      ]),
    );
  }
}