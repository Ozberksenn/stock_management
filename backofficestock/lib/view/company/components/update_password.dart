import 'package:backofficestock/product/widgets/custom_buttons.dart';
import 'package:backofficestock/view/company/company_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../core/widget/padding.dart';
import '../../../product/editors/form_text_field.dart';
import '../../form/widgets/form_label.dart';

class UpdatePassword extends StatelessWidget {
  final CompanyProvider provider;
  UpdatePassword({super.key, required this.provider});
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: CustomExpanded(
          child: Stack(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Update Password",
              style: Theme.of(context).textTheme.headlineMedium),
          const CustomSizedBox.paddingHeight(heightValue: 12.0),
          const FormLabel(text: "Mail"),
          FormTextField(
            name: "MAIL",
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email()
            ]),
          ),
          const CustomSizedBox.paddingHeight(heightValue: 8.0),
          const FormLabel(text: "Password"),
          FormTextField(
              name: "PASSWORD",
              obscureText: true,
              maxLines: 1,
              validator: FormBuilderValidators.required()),
          const CustomSizedBox.paddingHeight(heightValue: 8.0),
          const FormLabel(text: "New Password"),
          FormTextField(
              name: "NEWPASSWORD",
              obscureText: true,
              maxLines: 1,
              validator: FormBuilderValidators.required()),
          const CustomSizedBox.paddingHeight(heightValue: 24.0),
          Container(
              alignment: Alignment.centerRight,
              child: CustomButton(
                  text: "Update Password",
                  onTap: () => provider.updatePassword(_formKey, context)))
        ]),
      ])),
    );
  }
}
