import 'package:flutter/material.dart';
import 'package:flutter_mental_health/app.dart';
import 'package:flutter_mental_health/view_models/app_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create: (_) => AppProvider(),
      builder: (context, _) => const MentalHealthApp(),
    ),
  );
}
