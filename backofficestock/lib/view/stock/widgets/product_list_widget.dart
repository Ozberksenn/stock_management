import 'package:flutter/material.dart';

import '../../../core/widget/padding.dart';
import '../stock_provider.dart';
import 'stock_product_card.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key,
    required this.stockProvider,
  });

  final StockProvider stockProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: stockProvider.isProductReady == true
          ? ListView.separated(
              shrinkWrap: true,
              itemCount: stockProvider.productsList.length,
              separatorBuilder: (context, index) {
                return stockProvider.productsList[index].menuId ==
                        stockProvider.selectedTab?.menuId
                    ? const CustomSizedBox.paddingHeight(heightValue: 16.0)
                    : const SizedBox();
              },
              itemBuilder: (context, index) {
                return stockProvider.productsList[index].menuId ==
                        stockProvider.selectedTab?.menuId
                    ? StockProductCard(
                        product: stockProvider.productsList[index],
                      )
                    : const SizedBox();
              })
          : Container(),
    );
  }
}
