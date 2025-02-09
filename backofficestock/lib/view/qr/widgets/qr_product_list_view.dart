import 'package:backofficestock/product/editors/switch.dart';
import 'package:backofficestock/product/widgets/custom_divider.dart';
import 'package:flutter/material.dart';

import '../../../core/widget/padding.dart';
import '../../../core/widget/radius.dart';
import '../../../product/constants/api_constants.dart';
import '../../../product/model/product_model.dart';
import '../../stock/stock_provider.dart';

class QrProductList extends StatelessWidget {
  const QrProductList({
    super.key,
    required this.stockProvider,
  });

  final StockProvider stockProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemCount: stockProvider.productsList.length,
          separatorBuilder: (context, index) {
            return const CustomDivider();
          },
          itemBuilder: (context, index) {
            return QrProductCard(
              product: stockProvider.productsList[index],
            );
          }),
    );
  }
}

class QrProductCard extends StatelessWidget {
  final ProductModel? product;
  const QrProductCard({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const ConstEdgeInsets.paddingSymetric(verticalPad: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
                borderRadius: CustomRadius.radius6,
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppString.customProfileUrl))),
          ),
          const CustomSizedBox.paddingWidth(
            widthValue: 8,
          ),
          CustomExpanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Text(product?.productName ?? "",
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                    Transform.scale(scale: 0.6, child: const SwitchWidget())
                  ],
                ),
              ),
              Text(product?.productDescription ?? "",
                  style: Theme.of(context).textTheme.bodySmall)
            ]),
          )
        ],
      ),
    );
  }
}
