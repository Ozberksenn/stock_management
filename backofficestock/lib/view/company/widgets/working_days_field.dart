import 'dart:convert';
import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/view/company/company_provider.dart';
import 'package:backofficestock/view/form/widgets/form_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class WorkingDaysField extends StatelessWidget {
  const WorkingDaysField({super.key});

  @override
  Widget build(BuildContext context) {
    CompanyProvider provider = context.watch<CompanyProvider>();
    Map<String, dynamic> initalValueWorkingDays =
        jsonDecode(provider.companyInfo['WORKINGHOURS']);
    return FormBuilderField<Map<String, dynamic>>(
      name: "WORKINGHOURS",
      initialValue: initalValueWorkingDays,
      builder: (field) {
        return Column(
          children: [
            TextFormForWorkingDays(field: field, fieldName: "Monday"),
            const CustomSizedBox.paddingHeight(heightValue: 8.0),
            TextFormForWorkingDays(field: field, fieldName: "Tuesday"),
            const CustomSizedBox.paddingHeight(heightValue: 8.0),
            TextFormForWorkingDays(field: field, fieldName: "Wednesday"),
            const CustomSizedBox.paddingHeight(heightValue: 8.0),
            TextFormForWorkingDays(field: field, fieldName: "Thursday"),
            const CustomSizedBox.paddingHeight(heightValue: 8.0),
            TextFormForWorkingDays(field: field, fieldName: "Friday"),
            const CustomSizedBox.paddingHeight(heightValue: 8.0),
            TextFormForWorkingDays(field: field, fieldName: "Saturday"),
            const CustomSizedBox.paddingHeight(heightValue: 8.0),
            TextFormForWorkingDays(field: field, fieldName: "Sunday"),
          ],
        );
      },
    );
  }
}

class TextFormForWorkingDays extends StatelessWidget {
  final FormFieldState<Map<String, dynamic>> field;
  final String fieldName;
  const TextFormForWorkingDays(
      {super.key, required this.field, required this.fieldName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormLabel(text: fieldName),
        TextFormField(
          decoration: InputDecoration(hintText: fieldName),
          initialValue: field.value?[fieldName],
          onChanged: (val) {
            field.didChange({...field.value ?? {}, fieldName: val});
          },
        ),
      ],
    );
  }
}
