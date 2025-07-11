import 'package:backofficestock/product/model/product_model.dart';
import 'package:backofficestock/product/utils/undefined/no_item_widget.dart';
import 'package:flutter/material.dart';
import '../../stock/stock_provider.dart';
import 'qr_product_card_widget.dart';

class QrProductList extends StatelessWidget {
  const QrProductList({
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
              ? ReorderableListView.builder(
                  cacheExtent: 0.5,
                  itemBuilder: (context, index) {
                    return QrProductCard(
                      key: ValueKey(filterProducList[index].id),
                      provider: stockProvider,
                      product: filterProducList[index],
                    );
                  },
                  itemCount: filterProducList.length,
                  onReorder: (oldIndex, newIndex) {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    stockProvider.updateOrder(
                      context,
                      productId: filterProducList[oldIndex].id,
                      newOrder: filterProducList[newIndex].sort!,
                    );
                    stockProvider.uiOrderUpdate(
                        oldIndex, newIndex, filterProducList);
                  })
              : const NoItemWidget(
                  message: "There are no products in this menu",
                )
          : Container(),
    );
  }
}
