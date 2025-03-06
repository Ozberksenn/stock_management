import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormTextField extends StatelessWidget {
  final String name;
  final String? hintText;
  final int? maxLines;
  final bool? obscureText;
  final TextEditingController? textEditingController;
  final Function(String?)? onChanged;
  final void Function(String?)? onSubmitted;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? postDataType; // dataya gönderileek veri
  final String? initialValue;
  final String? Function(String?)? validator;
  const FormTextField(
      {super.key,
      required this.name,
      this.onChanged,
      this.onSubmitted,
      this.keyboardType,
      this.maxLines,
      this.postDataType,
      this.initialValue,
      this.obscureText,
      this.textEditingController,
      this.suffixIcon,
      this.hintText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      controller: textEditingController,
      name: name,
      valueTransformer: (value) {
        if (postDataType == "int") {
          return int.tryParse(value ?? '') ?? 0; // Sayı ise int olarak gönder
        }
        return value; // Diğer alanları string olarak bırak
      },
      initialValue: initialValue,
      maxLines: maxLines,
      decoration: InputDecoration(hintText: hintText, suffixIcon: suffixIcon),
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      validator: validator,
    );
  }
}
