import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/widgets/custom_elevated_button.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<dynamic> successPopup(BuildContext context, {String? message}) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            backgroundColor: AppColors.white,
            child: Container(
              width: context.dynamicWidth(0.3),
              padding: const ConstEdgeInsets.padding16(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomIcon(
                      icon: CupertinoIcons.xmark,
                      onTap: () => context.pop(),
                      size: 30,
                    ),
                  ),
                  const CustomIcon(
                      icon: CupertinoIcons.checkmark_alt_circle_fill,
                      size: 70,
                      color: AppColors.green),
                  Text(
                    "Success",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(message ?? "",
                      style: Theme.of(context).textTheme.bodyMedium),
                  const CustomSizedBox.paddingHeight(heightValue: 30),
                  CustomElevatedButton(
                    text: "Done",
                    color: AppColors.black,
                    style: AppFonts.greylabelSmall,
                  )
                ],
              ),
            ));
      });
}
