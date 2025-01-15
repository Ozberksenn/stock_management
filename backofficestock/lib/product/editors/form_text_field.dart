import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormTextField extends StatelessWidget {
  final String name;
  final Function(String?)? onChanged;
  final TextInputType? keyboardType;
  const FormTextField(
      {super.key, required this.name, this.onChanged, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.always,
      name: name,
      decoration: const InputDecoration(),
      onChanged: onChanged,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
    );
  }
}
