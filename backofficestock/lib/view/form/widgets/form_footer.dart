import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/view/form/form_provider.dart';
import 'package:flutter/material.dart';
import '../../../product/constants/api_constants.dart';

class FormFooter extends StatelessWidget {
  final void Function()? onTap;
  final FormProvider formProvider;
  const FormFooter({super.key, this.onTap, required this.formProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: AppColors.dark,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            formProvider.isButton == true
                ? InkWell(
                    onTap: onTap,
                    child: Padding(
                      padding: const ConstEdgeInsets.paddingSymetric(
                          horizontalPad: 12.0, verticalPad: 8.0),
                      child: Text('Save'.toUpperCase(),
                          style: AppFonts.whiteHeadlineSmall),
                    ),
                  )
                : Padding(
                    padding: const ConstEdgeInsets.paddingSymetric(
                        horizontalPad: 12.0, verticalPad: 8.0),
                    child: Text('Save'.toUpperCase(),
                        style: AppFonts.whiteHeadlineSmall
                            .copyWith(color: AppColors.grey)),
                  ),
          ],
        ));
  }
}
