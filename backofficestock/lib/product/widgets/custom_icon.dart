import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData? icon;
  final double? size;
  final Color? color;
  final Function()? onTap;
  const CustomIcon(
      {super.key, required this.icon, this.onTap, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          size: size ?? 20,
          color: color ?? AppColors.black,
        ));
  }
}
