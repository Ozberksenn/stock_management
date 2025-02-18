import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/widgets/custom_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/widget/padding.dart';
import '../../../product/widgets/custom_icon.dart';

class BasketWidget extends StatelessWidget {
  const BasketWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomExpanded(
      child: Padding(
        padding: const ConstEdgeInsets.padding8(),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Sepet",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              trailing: const CustomIcon(icon: CupertinoIcons.xmark),
            ),
            const CustomDivider(
              color: AppColors.dark,
            )
          ],
        ),
      ),
    );
  }
}
