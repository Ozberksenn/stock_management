import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormCheckboxField extends StatelessWidget {
  final String name;
  final String? text;
  final String? Function(bool?)? validator;
  final bool? initialValue;
  const FormCheckboxField(
      {super.key,
      required this.name,
      this.validator,
      this.initialValue,
      this.text});

  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckbox(
        contentPadding: EdgeInsets.zero,
        name: name,
        initialValue: initialValue,
        title: Text(text ?? "", style: AppFonts.inputStyle),
        validator: validator);
  }
}
