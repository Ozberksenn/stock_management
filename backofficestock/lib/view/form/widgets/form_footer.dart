import 'package:backofficestock/core/widget/padding.dart';
import 'package:flutter/material.dart';
import '../../../product/constants/api_constants.dart';

class FormFooter extends StatelessWidget {
  const FormFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const ConstEdgeInsets.paddingSymetric(
                    horizontalPad: 12.0, verticalPad: 8.0),
                child: Text('Save'.toUpperCase(),
                    style: AppFonts.whiteHeadlineSmall),
              ),
            )
          ],
        ));
  }
}
