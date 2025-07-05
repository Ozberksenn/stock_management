import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../core/widget/padding.dart';
import '../../../core/widget/radius.dart';
import '../../../product/constants/api_constants.dart';
import '../../../product/widgets/custom_icon.dart';

class ReportCard extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final String? subtitle;
  const ReportCard({
    super.key,
    this.icon,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.14),
      decoration: BoxDecoration(
        color: AppColors.softGrey,
        borderRadius: CustomRadius.radius8,
        border: Border.all(
          color: AppColors.lightGrey,
          width: 1.0,
        ),
      ),
      child: Center(
        child: ListTile(
          leading: icon != null
              ? Container(
                  decoration: BoxDecoration(
                    color: AppColors.dark,
                    borderRadius: CustomRadius.radius8,
                  ),
                  padding: const ConstEdgeInsets.padding6(),
                  child: const CustomIcon(
                    icon: Iconsax.activity,
                    color: AppColors.white,
                    size: 26,
                  ),
                )
              : const SizedBox(),
          title: Text(
            title ?? "",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(subtitle ?? "",
              style: Theme.of(context).textTheme.bodySmall),
        ),
      ),
    );
  }
}
