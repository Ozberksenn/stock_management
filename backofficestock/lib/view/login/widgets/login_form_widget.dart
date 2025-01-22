import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/widgets/custom_buttons.dart';
import 'package:backofficestock/view/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/widget/padding.dart';
import '../../../product/editors/form_text_field.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    LoginProvider provider = context.read<LoginProvider>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Column(children: [
          Image.asset(
            "assets/logo/stock-dark.png",
            width: 160,
            height: 160,
          ),
          const CustomSizedBox.paddingHeight(heightValue: 20),
          FormBuilder(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FormTextField(name: "mail", hintText: "Mail"),
                    const CustomSizedBox.paddingHeight(heightValue: 10),
                    const FormTextField(
                      name: "password",
                      hintText: "Password",
                      obscureText: true,
                    ),
                    const CustomSizedBox.paddingHeight(heightValue: 20),
                    Align(
                        alignment: Alignment.centerRight,
                        child: CustomButton(
                            text: "Login",
                            onTap: () async {
                              var result = await provider.handleSave(_formKey);
                              if (result == true) {
                                context.go("/home");
                              }
                            }))
                  ])),
        ]),
        Text(
          'Therms of policy - Privacy Policy',
          style: AppFonts.greylabelSmall,
        )
      ],
    );
  }
}
