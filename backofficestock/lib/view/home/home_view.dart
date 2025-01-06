import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/core/widget/radius.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/view/home/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: context.dynamicWidth(1),
      height: context.dynamicHeight(1),
      color: AppColors.black,
      child: Row(
        children: [
          const NavigationBarWidget(),
          CustomExpanded(
              flex: 5,
              child: CustomPaddings.customPadding(
                  value: 20,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: CustomRadius.radius16),
                  )))
        ],
      ),
    ));
  }
}
