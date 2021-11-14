import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mental_health/views/home_screen.dart';

class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.id:
        return CupertinoPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('Error'),
        ),
      ),
      settings: const RouteSettings(
        name: '/error',
      ),
    );
  }
}
