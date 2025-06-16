import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:backofficestock/product/utils/modal/custom_dialog.dart';
import 'package:backofficestock/view/check/check_provider.dart';
import 'package:backofficestock/view/check/widgets/select_order_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../product/widgets/custom_icon.dart';

class CheckOrder extends StatelessWidget {
  final CheckProvider provider;
  const CheckOrder({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Order Detail", style: Theme.of(context).textTheme.titleMedium),
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
                    title: Text(
                        provider.selectedTable?.products?[index].productName ??
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
  }
}
