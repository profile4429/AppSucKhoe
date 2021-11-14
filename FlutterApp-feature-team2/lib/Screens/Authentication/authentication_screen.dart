import 'package:flutter/material.dart';

import 'components/tabcontrol.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (const Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(child: TabControl()),
      )
    );
  }
}
 