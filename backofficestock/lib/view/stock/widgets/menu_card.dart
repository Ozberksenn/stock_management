import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/core/widget/radius.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:flutter/material.dart';

class MenuTab extends StatelessWidget {
  final String? text;
  const MenuTab({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Container(
      padding: const ConstEdgeInsets.paddingSymetric(
          verticalPad: 6.0, horizontalPad: 12.0),
      decoration: BoxDecoration(
          borderRadius: CustomRadius.radius6, color: AppColors.white),
      child: Text(text?.toUpperCase() ?? '',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.bold)),
    ));
  }
}
