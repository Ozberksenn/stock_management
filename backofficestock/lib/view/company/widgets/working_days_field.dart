import 'dart:convert';
import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/view/company/company_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'custom_text_form.dart';

class WorkingDaysField extends StatelessWidget {
  const WorkingDaysField({super.key});

  @override
  Widget build(BuildContext context) {
    CompanyProvider provider = context.watch<CompanyProvider>();
    Map<String, dynamic> initalValueWorkingDays =
        jsonDecode(provider.companyInfo['WorkingHours']);
    return FormBuilderField<Map<String, dynamic>>(
      name: "WorkingHours",
      initialValue: initalValueWorkingDays,
      builder: (field) {
        return Column(
          children: [
            CustomTextForm(field: field, fieldName: "Monday"),
            const CustomSizedBox.paddingHeight(heightValue: 8.0),
            CustomTextForm(field: field, fieldName: "Tuesday"),
            const CustomSizedBox.paddingHeight(heightValue: 8.0),
            CustomTextForm(field: field, fieldName: "Wednesday"),
            const CustomSizedBox.paddingHeight(heightValue: 8.0),
            CustomTextForm(field: field, fieldName: "Thursday"),
            const CustomSizedBox.paddingHeight(heightValue: 8.0),
            CustomTextForm(field: field, fieldName: "Friday"),
            const CustomSizedBox.paddingHeight(heightValue: 8.0),
            CustomTextForm(field: field, fieldName: "Saturday"),
            const CustomSizedBox.paddingHeight(heightValue: 8.0),
            CustomTextForm(field: field, fieldName: "Sunday"),
          ],
        );
      },
    );
  }
}
