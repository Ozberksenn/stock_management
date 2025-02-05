import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FormImagePicker extends StatelessWidget {
  final String name;
  final double? height;
  const FormImagePicker({super.key, required this.name, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? context.dynamicHeight(0.25),
      width: context.dynamicWidth(1),
      padding: const ConstEdgeInsets.padding20(),
      child: const CustomIcon(
        icon: Iconsax.camera,
        size: 48,
        color: AppColors.blue,
      ),
    );
  }
}
