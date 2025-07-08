import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:backofficestock/view/check/check_provider.dart';
import 'package:backofficestock/view/check/model/table_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../product/constants/api_constants.dart';
import '../../../product/utils/modal/custom_dialog.dart';
import '../../form/form_view.dart';

class CheckCard extends StatelessWidget {
  final TableModel? table;
  const CheckCard({super.key, required this.table});

  @override
  Widget build(BuildContext context) {
    CheckProvider provider = context.watch<CheckProvider>();

    handleTable() {
      provider.selectedTable = table;
      customDialog(context,
          widget: FormView(
            apiUrl: "/updateTable",
            dialogContext: context,
            provider: provider,
            title: "Edit Table",
            route: "table",
            initialValue: table?.toMap() ?? {},
            parameters: {"TableId": table?.id},
            edit: true,
          ));
    }

    return GestureDetector(
      onTap: () => handleTable(),
      child: Container(
        padding: const ConstEdgeInsets.padding4(),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: table?.status == "Active"
                ? AppColors.activeCardColor
                : table?.status == "Reserved"
                    ? AppColors.reservedCardColor
                    : AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withValues(alpha: 0.3),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  Text("Table No : ",
                      style: Theme.of(context).textTheme.bodySmall),
                  Text(table?.tableNo ?? "", style: AppFonts.boldSmall),
                ],
              ),
              CustomIcon(
                icon: CupertinoIcons.delete,
                onTap: () => provider.removeTableCondition(
                    table!.status, context, table!.id),
                size: 14,
              )
            ]),
            Row(children: [
              Text("Status : ", style: Theme.of(context).textTheme.bodySmall),
              Text(
                table?.status ?? "",
                style: AppFonts.boldSmall,
              ),
            ]),
            Text(table?.customerName ?? ""),
            table?.products != null
                ? Text("Products", style: Theme.of(context).textTheme.bodySmall)
                : const SizedBox(),
            table?.products != null
                ? CustomExpanded(
                    child: ListView.builder(
                        itemCount: table?.products?.length,
                        itemBuilder: (context, index) {
                          return Container(
                            color: AppColors.lightGrey,
                            padding: const ConstEdgeInsets.padding2(),
                            margin: const ConstEdgeInsets.paddingSymetric(
                                verticalPad: 2.0),
                            child: Text(
                                "${table?.products?[index].productName} - "
                                "${table?.products?[index].price} TL",
                                style: Theme.of(context).textTheme.bodySmall),
                          );
                        }),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
