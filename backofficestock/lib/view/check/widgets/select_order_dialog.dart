import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/model/product_model.dart';
import 'package:backofficestock/product/model/product_variation_model.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:backofficestock/view/check/check_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
          TextField(
              onChanged: (value) {
                provider?.searchOrderValue = value;
                provider?.filterProductList(value);
              },
              decoration: const InputDecoration(
                hintText: "Search Order",
              )),
          const CustomSizedBox.paddingHeight(heightValue: 12.0),
          selectOrderList(context)
        ],
      ),
    );
  }

  Widget selectOrderList(BuildContext context) {
    CheckProvider? provider = context.watch<CheckProvider>();
    return CustomExpanded(
      child: provider.filtredProducts.isNotEmpty
          ? ListView.builder(
              itemCount: provider.filtredProducts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    provider.handleAddNewItem(
                        provider.filtredProducts[index], context);
                    context.pop();
                  },
                  contentPadding: const EdgeInsets.all(0.0),
                  title: Text(
                    provider.filtredProducts[index].productName,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  trailing: Text("${provider.filtredProducts[index].price} TL"),
                );
              })
          : ListView.separated(
              itemCount: provider.products.length,
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemBuilder: (context, index) {
                return provider.products[index].variants != null &&
                        provider.products[index].variants!.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: provider.products[index].variants!.length,
                        itemBuilder: (context, variantIndex) {
                          return selectOrderVariantItem(
                              provider.products[index].variants![variantIndex],
                              context);
                        })
                    : selectOrderItem(provider.products[index], context);
              }),
    );
  }

  ListTile selectOrderVariantItem(
      ProductVariantModel product, BuildContext context) {
    return ListTile(
      onTap: () {
        provider?.handleAddNewVariant(product, context);
        context.pop();
      },
      contentPadding: const EdgeInsets.all(0.0),
      title: Text(
        product.variantName,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: Text("${product.price} TL"),
    );
  }

  ListTile selectOrderItem(ProductModel product, BuildContext context) {
    return ListTile(
      onTap: () {
        provider?.handleAddNewItem(product, context);
        context.pop();
      },
      contentPadding: const EdgeInsets.all(0.0),
      title: Text(
        product.productName,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: Text("${product.price} TL"),
    );
  }

  Widget selectOrderHeader(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text("Select Order", style: Theme.of(context).textTheme.titleMedium),
      CustomIcon(
          icon: CupertinoIcons.xmark_circle_fill,
          onTap: () {
            context.pop();
            provider?.filtredProducts.clear();
          })
    ]);
  }
}
