import 'package:backofficestock/product/model/product_model.dart';
import 'package:backofficestock/product/utils/undefined/no_item_widget.dart';
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
    List<ProductModel> filterProducList = stockProvider.productsList
        .where((element) => element.menuId == stockProvider.selectedTab?.menuId)
        .toList();
    return Expanded(
      child: stockProvider.isProductReady == true
          ? filterProducList.isNotEmpty
              ? ListView.separated(
                  shrinkWrap: true,
                  itemCount: filterProducList.length,
                  separatorBuilder: (context, index) {
                    return const CustomSizedBox.paddingHeight(
                        heightValue: 16.0);
                  },
                  itemBuilder: (context, index) {
                    return StockProductCard(
                      product: filterProducList[index],
                    );
                  })
              : const NoItemWidget()
          : Container(),
    );
  }
}
