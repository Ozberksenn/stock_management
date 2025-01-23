import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  final String text;
  const FormLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppFonts.formLabelStyle,
    );
  }
}
