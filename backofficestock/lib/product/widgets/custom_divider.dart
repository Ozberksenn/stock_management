import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final Color? color;
  const CustomDivider({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? AppColors.lightGrey,
    );
  }
}
