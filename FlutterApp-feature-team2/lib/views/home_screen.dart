import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mental_health/configs/color_config.dart';
import 'package:flutter_mental_health/view_models/app_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const id = "HomeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kColor1,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.helloWorld),
            OutlinedButton(
                onPressed: () {
                  context.read<AppProvider>().toggleLocale();
                },
                child: Text(AppLocalizations.of(context)!.changeLanguage)),
          ],
        ),
      ),
    );
  }
}

class AppLocalizations {
  static of(BuildContext context) {}
}
