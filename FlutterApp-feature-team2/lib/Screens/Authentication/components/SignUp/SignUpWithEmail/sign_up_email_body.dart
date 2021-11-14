import 'package:flutter/material.dart';
import 'package:flutter_mental_health/components/date_picker_widget.dart';
import 'package:flutter_mental_health/components/dropdown_field.dart';
import 'package:flutter_mental_health/components/rounded_button.dart';
import 'package:flutter_mental_health/components/text_field_input.dart';
import 'package:flutter_mental_health/constants.dart';
import 'package:flutter_mental_health/models/login_request_model.dart';
import 'package:flutter_mental_health/models/register_request_model.dart';
import 'package:flutter_mental_health/services/api_services.dart';
import '../../tabcontrol.dart';

class SignUpWithEmail extends StatefulWidget {
  const SignUpWithEmail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignUpWithEmailState();
  }
}

class _SignUpWithEmailState extends State<SignUpWithEmail> {
  late DateTime _date = DateTime.now();
  String _email = "";
  String _password = "";
  String _verifypassword = "";
  String _fullname = "";
  String _gender = "Others";

  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _verifypasswordcontroller = TextEditingController();
  final _fullnamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: (Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppBackgroundColor,
          title: (Title(
              color: AppBackgroundColor,
              child: const Text(
                "Sign up with email",
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
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                  width: double.infinity,
                ),
                TextFieldInput(
                  textController: _emailcontroller,
                  hinText: 'Email',
                  text: _email,
                  onTextChanged: (String text) {
                    setState(() {
                      _email = text;
                    });
                  },
                ),
                TextFieldInput(
                  hinText: "Password",
                  textController: _passwordcontroller,
                  text: _password,
                  onTextChanged: (String text) {
                    setState(() {
                      _password = text;
                    });
                  },
                ),
                TextFieldInput(
                  hinText: "Verify Password",
                  textController: _verifypasswordcontroller,
                  text: _verifypassword,
                  onTextChanged: (String text) {
                    setState(() {
                      _verifypassword = text;
                    });
                  },
                ),
                TextFieldInput(
                  hinText: "Full name",
                  textController: _fullnamecontroller,
                  text: _fullname,
                  onTextChanged: (String text) {
                    setState(() {
                      _fullname = text;
                    });
                  },
                ),
                DatePickerWidget(
                  date: _date,
                  onDateChanged: (DateTime date) {
                    setState(() {
                      _date = date;
                    });
                  },
                ),
                MyDropDown(
                  gender: _gender,
                  OnDropdownItemChanged: (String gender) {
                    setState(() {
                      _gender = gender;
                    });
                  },
                ),
                RoundedButton(
                    name: "Next",
                    marginVertical: 10,
                    press: () {
                      RegisterRequestModel registermodel = RegisterRequestModel( 
                              isLoginWithEmail: true,
                              isLoginWithPhone: false,                         
                              dateOfBirth: _date.toString(),
                              email: _email,
                              password: _password,
                              fullname: _fullname,
                              gender: _gender,
                              );
                      APIService.register(registermodel).then((response) {
                        if (response) {
                          //Login success! Navigator to home screen
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  const AlertDialog(
                                    title: Text('Register Success!'),
                                  ));
                        } else {
                          //Login falied!
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  const AlertDialog(
                                    title: Text('Register Failed!'),
                                  ));
                        }
                      });
                    }),
                RoundedButton(
                    name: "Cancel",
                    marginVertical: 10,
                    bgColor: Colors.white,
                    textColor: greyColor,
                    press: () => {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return TabControl();
                          }))
                        }),
                const SizedBox(
                  height: 50,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
