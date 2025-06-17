import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:backofficestock/view/check/check_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectOrderDialog extends StatelessWidget {
  final CheckProvider? provider;
  const SelectOrderDialog({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const ConstEdgeInsets.padding12(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          selectOrderHeader(context),
          const CustomSizedBox.paddingHeight(heightValue: 12.0),
          const TextField(
              decoration: InputDecoration(
            hintText: "Search Order",
          )),
          const CustomSizedBox.paddingHeight(heightValue: 12.0),
          selectOrderList(provider)
        ],
      ),
    );
  }

  Widget selectOrderList(CheckProvider? provider) {
    return CustomExpanded(
      child: ListView.separated(
          itemCount: provider?.products.length ?? 0,
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                provider?.handleAddNewItem(provider.products[index], context);
                context.pop();
              },
              contentPadding: const EdgeInsets.all(0.0),
              title: Text(
                provider?.products[index].productName ?? "",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              trailing: Text("${provider?.products[index].price} TL"),
            );
          }),
    );
  }

  Widget selectOrderHeader(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text("Select Order", style: Theme.of(context).textTheme.titleMedium),
      CustomIcon(
        icon: CupertinoIcons.xmark_circle_fill,
        onTap: () => context.pop(),
      )
    ]);
  }
}
