import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/utils/modal/custom_dialog.dart';
import 'package:backofficestock/product/widgets/custom_buttons.dart';
import 'package:backofficestock/view/check/check_provider.dart';
import 'package:backofficestock/view/form/form_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckHeader extends StatelessWidget {
  const CheckHeader({super.key});

  @override
  Widget build(BuildContext context) {
    CheckProvider provider = context.watch<CheckProvider>();
    return Container(
      width: context.dynamicWidth(1),
      padding: const ConstEdgeInsets.padding8(),
      color: AppColors.softGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Text("All ${provider.allTable}"),
            Text(
              " | ",
              style: AppFonts.boldSmall,
            ),
            Text("Active ${provider.activeTable}"),
            Text(" | ", style: AppFonts.boldSmall),
            Text("Reserved ${provider.reservedTable}")
          ]),
          CustomButton(
              text: "Add Table",
              onTap: () {
                provider.selectedTable = null;
                customDialog(context,
                    widget: FormView(
                      apiUrl: "/createTable",
                      dialogContext: context,
                      provider: provider,
                      title: "New Table",
                      route: "table",
                    ));
              })
        ],
      ),
    );
  }
}
