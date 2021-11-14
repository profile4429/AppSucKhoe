import 'package:flutter/material.dart';
import 'package:flutter_mental_health/Screens/Authentication/authentication_screen.dart';
import 'constants.dart';

class MentalHealthApp extends StatelessWidget {
  const MentalHealthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppBackgroundColor
      ),
      home: const AuthenticationScreen(),
    );
  }
}
