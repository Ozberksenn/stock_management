import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';

class CheckHeader extends StatelessWidget {
  const CheckHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(1),
      padding: const ConstEdgeInsets.padding8(),
      color: AppColors.softGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            const Text("Active 4"),
            Text(
              " | ",
              style: AppFonts.boldSmall,
            ),
            const Text("All 15"),
            Text(" | ", style: AppFonts.boldSmall),
            const Text("Reserved 2")
          ]),
          const CustomButton(text: "Add Table")
        ],
      ),
    );
  }
}
