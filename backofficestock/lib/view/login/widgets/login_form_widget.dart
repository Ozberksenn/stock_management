import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/widgets/custom_elevated_button.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:backofficestock/view/login/login_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import '../../../core/widget/padding.dart';
import '../../../product/editors/form_text_field.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    LoginProvider provider = context.watch<LoginProvider>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Column(children: [
          Image.asset(
            "assets/logo/logo.png",
            width: 160,
            height: 160,
          ),
          const CustomSizedBox.paddingHeight(heightValue: 20),
          FormBuilder(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormTextField(
                        name: "mail",
                        hintText: "Mail",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.email(),
                          FormBuilderValidators.required()
                        ]),
                        suffixIcon: const Icon(CupertinoIcons.mail),
                        textEditingController: provider.mailController),
                    const CustomSizedBox.paddingHeight(heightValue: 10),
                    FormTextField(
                        name: "password",
                        hintText: "Password",
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required()]),
                        obscureText: provider.isVisibleLoginPassword,
                        suffixIcon: CustomIcon(
                          icon: CupertinoIcons.eye,
                          onTap: () => provider.visiblePassword(),
                        ),
                        maxLines: 1,
                        textEditingController: provider.passwordController),
                    const CustomSizedBox.paddingHeight(heightValue: 20),
                    provider.isActiveLoginButton
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: CustomElevatedButton(
                                text: "Login",
                                color: AppColors.primaryColor,
                                style: AppFonts.whiteBodyMedium,
                                onPressed: () =>
                                    provider.handleSave(_formKey, context)),
                          )
                        : Align(
                            alignment: Alignment.centerRight,
                            child: CustomElevatedButton(
                              text: "Login",
                              color: AppColors.primaryColor.withOpacity(0.4),
                              style: AppFonts.whiteBodyMedium,
                            ),
                          ),
                    Row(
                      children: [
                        const Text("Don't have an account?"),
                        const CustomSizedBox.paddingWidth(widthValue: 4),
                        InkWell(
                          onTap: () => provider.changeStep(1),
                          child: Text(
                            " Sign up",
                            style: AppFonts.boldSmall,
                          ),
                        ),
                      ],
                    )
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
