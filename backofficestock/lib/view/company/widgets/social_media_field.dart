import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../../../core/widget/padding.dart';
import '../company_provider.dart';
import 'custom_text_form.dart';

class SocialMediaField extends StatelessWidget {
  const SocialMediaField({super.key});

  @override
  Widget build(BuildContext context) {
    CompanyProvider provider = context.watch<CompanyProvider>();
    Map<String, dynamic> initalValueWorkingDays =
        jsonDecode(provider.companyInfo['SOCIALMEDIA']);
    return FormBuilderField<Map<String, dynamic>>(
      name: "SOCIALMEDIA",
      initialValue: initalValueWorkingDays,
      builder: (field) {
        return Column(
          children: [
            CustomTextForm(field: field, fieldName: "instagram"),
            const CustomSizedBox.paddingHeight(heightValue: 8.0),
            CustomTextForm(field: field, fieldName: "facebook"),
            const CustomSizedBox.paddingHeight(heightValue: 8.0),
            CustomTextForm(field: field, fieldName: "x"),
            const CustomSizedBox.paddingHeight(heightValue: 8.0),
            CustomTextForm(field: field, fieldName: "youtube"),
          ],
        );
      },
    );
  }
}
