import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormTextField extends StatelessWidget {
  final String name;
  final String? hintText;
  final int? maxLines;
  final bool? obscureText;
  final TextEditingController? textEditingController;
  final Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? postDataType; // dataya gönderileek veri
  final String? initialValue;
  const FormTextField(
      {super.key,
      required this.name,
      this.onChanged,
      this.keyboardType,
      this.maxLines,
      this.postDataType,
      this.initialValue,
      this.obscureText,
      this.textEditingController,
      this.suffixIcon,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      controller: textEditingController,
      autovalidateMode: AutovalidateMode.always,
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
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
    );
  }
}
