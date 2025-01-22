import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/core/widget/radius.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Color? color;
  const CustomButton({super.key, required this.text, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
                color: color ?? AppColors.blue,
                borderRadius: CustomRadius.radius4),
            padding: const ConstEdgeInsets.paddingSymetric(
                horizontalPad: 12.0, verticalPad: 6.0),
            child: Text(
              text,
              style: AppFonts.whiteBodyMedium,
            )));
  }
}
