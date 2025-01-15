import 'package:backofficestock/core/widget/padding.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        const CustomExpanded(flex: 1, child: Text('data')),
        CustomExpanded(flex: 3, child: Container())
      ]),
    );
  }
}
