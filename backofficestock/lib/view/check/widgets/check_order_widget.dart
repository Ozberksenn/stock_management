import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/utils/modal/custom_dialog.dart';
import 'package:backofficestock/view/check/check_provider.dart';
import 'package:backofficestock/view/check/widgets/select_order_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../product/widgets/custom_icon.dart';

class CheckOrder extends StatelessWidget {
  const CheckOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckProvider>(
      builder: (context, provider, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("Order Detail",
                  style: Theme.of(context).textTheme.titleMedium),
              CustomIcon(
                  icon: CupertinoIcons.add_circled,
                  onTap: () => customDialog(context,
                      width: context.dynamicWidth(0.3),
                      height: context.dynamicHeight(0.8),
                      widget: SelectOrderDialog(
                        provider: provider,
                      )))
            ]),
            const Divider(),
            provider.selectedTable?.products?.isNotEmpty ?? false
                ? ListView.builder(
                    itemCount: provider.selectedTable?.products?.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CustomIcon(
                          icon: CupertinoIcons.delete,
                          size: 14.0,
                          color: AppColors.red,
                          onTap: () => provider.removeTableProdcut(
                              provider.selectedTable!.products![index],
                              index,
                              context),
                        ),
                        title: Text(provider
                                .selectedTable?.products?[index].productName ??
                            ""),
                        trailing: Text(
                          "${provider.selectedTable?.products?[index].price.toString() ?? ""} TL",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      );
                    })
                : const SizedBox()
          ],
        );
      },
    );
  }
}
