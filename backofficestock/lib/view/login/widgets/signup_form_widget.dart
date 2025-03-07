import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/constants/masks.dart';
import 'package:backofficestock/product/widgets/custom_elevated_button.dart';
import 'package:backofficestock/view/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import '../../../core/widget/padding.dart';
import '../../../product/editors/form_text_field.dart';

class SignupForm extends StatelessWidget {
  SignupForm({super.key});
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
                      name: "CONTACTMAIL",
                      hintText: "Mail",
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.email(),
                        FormBuilderValidators.required()
                      ]),
                    ),
                    const CustomSizedBox.paddingHeight(heightValue: 10),
                    FormTextField(
                      name: "PHONE",
                      hintText: "Phone",
                      inputFormatters: [phoneFormatter],
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.phoneNumber()
                      ]),
                    ),
                    const CustomSizedBox.paddingHeight(heightValue: 10),
                    const FormTextField(
                      name: "COMPANYNAME",
                      hintText: "Company Name",
                    ),
                    const CustomSizedBox.paddingHeight(heightValue: 10),
                    const FormTextField(
                      name: "DESCRIPTION",
                      maxLines: 4,
                      hintText: "Description",
                    ),
                    const CustomSizedBox.paddingHeight(heightValue: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomElevatedButton(
                        text: "Send",
                        color: AppColors.primaryColor,
                        style: AppFonts.whiteBodyMedium,
                        onPressed: () => provider.signUpForm(_formKey, context),
                      ),
                    ),
                    const CustomSizedBox.paddingHeight(heightValue: 10),
                    Row(
                      children: [
                        const Text("Already you have an account?"),
                        const CustomSizedBox.paddingWidth(widthValue: 4),
                        InkWell(
                          onTap: () => provider.changeStep(0),
                          child: Text(
                            " Sign in",
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
