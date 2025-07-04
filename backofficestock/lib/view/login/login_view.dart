import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/view/login/login_provider.dart';
import 'package:backofficestock/view/login/widgets/signup_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/login_form_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LoginProvider(),
        builder: (context, child) {
          LoginProvider provider = context.watch<LoginProvider>();
          return Scaffold(
            body: Row(children: [
              const CustomSizedBox.paddingWidth(widthValue: 40),
              CustomExpanded(
                  flex: 2,
                  child: provider.step == 0 ? LoginForm() : SignupForm()),
              const CustomSizedBox.paddingWidth(widthValue: 40),
              CustomExpanded(
                  flex: 5,
                  child: Container(
                    padding: const ConstEdgeInsets.padding20(),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/login.jpeg"))),
                  ))
            ]),
          );
        });
  }
}
