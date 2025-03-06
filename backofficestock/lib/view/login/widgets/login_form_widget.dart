import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:backofficestock/product/utils/modal/error_popup.dart';
import 'package:backofficestock/product/widgets/custom_elevated_button.dart';
import 'package:backofficestock/product/widgets/snackbar_widgets.dart';
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
                        textEditingController: provider.mailController),
                    const CustomSizedBox.paddingHeight(heightValue: 10),
                    FormTextField(
                        name: "password",
                        hintText: "Password",
                        obscureText: true,
                        maxLines: 1,
                        textEditingController: provider.passwordController),
                    const CustomSizedBox.paddingHeight(heightValue: 20),
                    provider.isActiveLoginButton == true
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: CustomElevatedButton(
                              text: "Login",
                              color: AppColors.primaryColor,
                              style: AppFonts.whiteBodyMedium,
                              onPressed: () async {
                                ServiceResponse result =
                                    await provider.handleSave(_formKey);
                                if (result.isSuccess == true) {
                                  successSnackbar(
                                      context: context,
                                      message: result.message);
                                  context.go("/");
                                } else {
                                  errorPopup(context, message: result.message);
                                }
                              },
                            ),
                          )
                        : Align(
                            alignment: Alignment.centerRight,
                            child: CustomElevatedButton(
                              text: "Login",
                              color: AppColors.primaryColor.withOpacity(0.4),
                              style: AppFonts.whiteBodyMedium,
                            ),
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
