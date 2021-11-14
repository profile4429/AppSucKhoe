import 'package:flutter/material.dart';
import 'package:flutter_mental_health/components/rounded_button.dart';
import 'package:flutter_mental_health/components/text_field_input.dart';
import 'package:flutter_mental_health/models/login_request_model.dart';
import 'package:flutter_mental_health/services/api_services.dart';

import '../../../constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  String _userName = "";
  late String _PassWord = "";
  final _textControllerPhone = TextEditingController();
  final _textControllerPassword = TextEditingController();

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 108,
                decoration: const BoxDecoration(color: greyColor),
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(borderRadius)),
                margin: EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: TextField(
                  onChanged: (text) => {
                    this.setState(() {
                      _userName = text;
                    })
                  },
                  controller: _textControllerPhone,
                  enabled: true,
                  cursorColor: blackColor,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: borderColor),
                          borderRadius: BorderRadius.circular(borderRadius)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                      hintText: "Email/Phone number",
                      hintStyle: TextStyle(color: greyColor)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(borderRadius)),
                margin: EdgeInsets.only(bottom: 20),
                width: double.infinity,
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                      _PassWord = text;
                    });
                  },
                  controller: _textControllerPassword,
                  enabled: true,
                  cursorColor: blackColor,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: borderColor),
                          borderRadius: BorderRadius.circular(borderRadius)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: greyColor)),
                ),
              ),
              RoundedButton(
                  name: "Login",
                  marginVertical: 10,

                  //login event
                  press: () {
                    var userName = _userName;
                    var phonenum = "";
                    var email = "";
                    if (userName.contains(
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'))) {
                      email = userName;
                    } else {
                      phonenum = userName;
                    }
                    LoginRequestModel model = LoginRequestModel(
                        phoneNumber: phonenum,
                        email: email,
                        password: _PassWord);
                    APIService.login(model).then((response) {
                      if (response) {
                        //Login success! Navigator to home screen
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                const AlertDialog(
                                  title: Text('Login Success!'),
                                ));
                      } else {
                        //Login falied!
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                const AlertDialog(
                                  title: Text('Login Failed!'),
                                ));
                      }
                    });
                  }),
              const SizedBox(
                height: 20,
                width: double.infinity,
              ),
              const Text("Forgot password?",
                  style: TextStyle(
                      fontFamily: textFont,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                      color: blackColor)),
              const SizedBox(
                height: 20,
                width: double.infinity,
              ),
              RoundedButton(
                  name: "Log in with Facebook",
                  marginVertical: 10,
                  press: () => {}),
            ],
          ),
        ),
      ),
    );
  }
}
