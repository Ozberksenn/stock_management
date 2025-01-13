import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:backofficestock/core/widget/padding.dart';
import 'package:flutter/material.dart';
import '../../../product/constants/api_constants.dart';

class FormFooter extends StatelessWidget {
  const FormFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
            height: 50,
            decoration: const BoxDecoration(
                color: AppColors.dark,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(12.0))),
            width: context.dynamicWidth(1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const ConstEdgeInsets.paddingSymetric(
                        horizontalPad: 12.0),
                    child: Text('Save'.toUpperCase(),
                        style: AppFonts.whiteTitleLarge),
                  ),
                )
              ],
            )));
  }
}
