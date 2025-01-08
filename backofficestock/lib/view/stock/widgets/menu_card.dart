import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/core/widget/radius.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:flutter/material.dart';

class MenuTab extends StatelessWidget {
  const MenuTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Container(
      padding: ConstEdgeInsets.paddingSymetric(
          verticalPad: 6.0, horizontalPad: 12.0),
      decoration: BoxDecoration(
          borderRadius: CustomRadius.radius6, color: AppColors.dark),
      child: Text('TEST'.toUpperCase(), style: AppFonts.whiteBodyMedium),
    ));
  }
}
