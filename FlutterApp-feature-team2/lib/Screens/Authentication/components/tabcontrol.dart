import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_mental_health/components/label_text.dart';
import 'package:flutter_mental_health/components/rounded_button.dart';
import 'package:flutter_mental_health/constants.dart';
import 'package:flutter_mental_health/models/login_request_model.dart';
import 'package:flutter_mental_health/services/api_services.dart';
import '../data_provicy.dart';
import 'SignUp/SignUpWithEmail/sign_up_email_body.dart';
import 'SignUp/SignUpWithPhone/sign_up_with_phone.dart';
import '../../../components/text_field_input.dart';
import 'package:http/http.dart' as http;

import 'SignUp/sign_up_body.dart';
import 'login_body.dart';

class TabControl extends StatefulWidget {
  const TabControl({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TabControlState();
  }
}

class _TabControlState extends State<TabControl>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;



  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppBackgroundColor,
            shadowColor: Colors.transparent,
            bottom: TabBar(
                controller: _tabController,
                indicatorColor: blackColor,
                labelColor: blackColor,
                unselectedLabelColor: greyColor,
                tabs: const [
                  Tab(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: textFont,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: textFont,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ]),
          ),
          body: TabBarView(controller: _tabController, children: [
            LoginScreen(),
            const SignUpScreen(),
          ]),
        );
      }),
    );
  }
}




