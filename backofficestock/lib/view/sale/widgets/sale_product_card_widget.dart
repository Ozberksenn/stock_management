import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../core/decoration/decoration.dart';
import '../../../core/widget/padding.dart';
import '../../../product/utils/undefined/no_image_widget.dart';
import '../sale_provider.dart';

class SaleProductCard extends StatelessWidget {
  final SaleProvider provider;
  const SaleProductCard({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      provider.productFounded?.image != null &&
              provider.productFounded?.image != ""
          ? Container(
              width: context.dynamicWidth(1),
              height: context.dynamicHeight(0.20),
              decoration: CustomDecoration.radiusImageDecoration(
                  NetworkImage(provider.productFounded!.image.toString())),
            )
          : NoImage(
              width: context.dynamicWidth(1),
              height: context.dynamicHeight(0.20),
            ),
      ListTile(
        contentPadding: const ConstEdgeInsets.padding0(),
        title: Text(provider.productFounded?.productName ?? ""),
        subtitle: Text(provider.productFounded?.barcode ?? ""),
        trailing: Text("Quantity: ${provider.productFounded?.quantity}"),
      ),
      const CustomSizedBox.paddingHeight(heightValue: 8.0),
    ]);
  }
}
