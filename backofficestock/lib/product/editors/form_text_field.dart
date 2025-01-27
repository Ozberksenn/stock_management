import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormTextField extends StatelessWidget {
  final String name;
  final String? hintText;
  final bool? obscureText;
  final TextEditingController? textEditingController;
  final Function(String?)? onChanged;
  final TextInputType? keyboardType;
  const FormTextField(
      {super.key,
      required this.name,
      this.onChanged,
      this.keyboardType,
      this.obscureText,
      this.textEditingController,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      controller: textEditingController,
      autovalidateMode: AutovalidateMode.always,
      name: name,
      decoration: InputDecoration(hintText: hintText),
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
    );
  }
}
