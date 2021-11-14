import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mental_health/components/rounded_button.dart';
import 'package:flutter_mental_health/constants.dart';
import 'package:flutter_mental_health/models/otp_signup_model.dart';
import 'package:flutter_mental_health/services/api_services.dart';
import '../../tabcontrol.dart';
import 'PhoneAuthentication/sign_up_authen.dart';

class SignUpWithPhone extends StatefulWidget {
  const SignUpWithPhone({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignUpWithPhoneState();
  }
}

class _SignUpWithPhoneState extends State<SignUpWithPhone> {
  String _phone = '';
  final phoneEdittingController = TextEditingController();
  late Map data;
  String message = "";
  late String hash;
  @override
  Widget build(BuildContext context) {
    String prefixText = "+84";
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: (Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppBackgroundColor,
          title: (Title(
              color: AppBackgroundColor,
              child: const Text(
                "Sign up with phone number",
                style: TextStyle(
                    color: blackColor,
                    fontFamily: textFont,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ))),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              color: blackColor,
              onPressed: () {
                Navigator.pop(context, false);
              }),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: phoneEdittingController,
                  onChanged: (text) {
                    setState(() {
                      _phone = text;
                    });
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: borderColor),
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: borderColor),
                        borderRadius: BorderRadius.circular(borderRadius)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    hintText: " Phone",
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: blackColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    hintStyle: const TextStyle(color: greyColor),
                    prefixIcon: const Icon(
                      Icons.circle_rounded,
                      color: greyColor,
                    ),
                    prefixText: prefixText,
                  ),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 20,
                  width: double.infinity,
                ),
                RoundedButton(
                    name: "Send code",
                    press: () {
                      OtpRequestModel model =
                          OtpRequestModel(phoneNumber: "0" + _phone);
                      APIService.otp(model).then((response) {
                        setState(() {
                          data = response;
                          message = data['message'];
                          hash = data['data'];
                        });
                        if (message.isNotEmpty) {
                          //Login success! Navigator to home screen
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignUpAuthenticate(
                              PhoneNum: ('0' + _phone),
                              hashKey: hash,
                            );
                          }));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  const AlertDialog(
                                    title: Text(
                                        'Your phone number is incorrect! Please check again!'),
                                  ));
                        }
                      });
                    }),
                const SizedBox(
                  height: 10,
                  width: double.infinity,
                ),
                RoundedButton(
                    name: "Cancel",
                    marginVertical: 10,
                    bgColor: Colors.transparent,
                    textColor: greyColor,
                    press: () => {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const TabControl();
                          }))
                        }),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
