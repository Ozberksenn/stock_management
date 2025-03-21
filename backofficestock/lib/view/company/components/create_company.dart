import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/editors/form_text_field.dart';
import 'package:backofficestock/view/company/company_provider.dart';
import 'package:backofficestock/view/form/widgets/form_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../product/widgets/custom_buttons.dart';

class CreateCompany extends StatelessWidget {
  final CompanyProvider provider;
  CreateCompany({super.key, required this.provider});
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: CustomExpanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Create Company",
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
          const FormLabel(text: "Company Name"),
          FormTextField(
            name: "COMPANYNAME",
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.maxLength(30)
            ]),
          ),
          const CustomSizedBox.paddingHeight(heightValue: 8.0),
          const FormLabel(text: "Role"),
          FormTextField(
            name: "ROLE",
            postDataType: "int",
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.numeric(),
            ]),
          ), // todo :  dropdown olsun.
          const CustomSizedBox.paddingHeight(heightValue: 16.0),
          Container(
              alignment: Alignment.centerRight,
              child: CustomButton(
                  text: "Create a Company",
                  onTap: () => provider.handleCreateCompany(_formKey, context)))
        ]),
      ),
    );
  }
}
