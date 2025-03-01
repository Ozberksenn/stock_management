import 'package:backofficestock/product/model/product_model.dart';
import 'package:backofficestock/product/widgets/custom_divider.dart';
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
              ? ListView.separated(
                  shrinkWrap: true,
                  itemCount: filterProducList.length,
                  separatorBuilder: (context, index) {
                    return const CustomDivider();
                  },
                  itemBuilder: (context, index) {
                    return QrProductCard(
                      product: filterProducList[index],
                    );
                  })
              : const NoItemWidget()
          : Container(),
    );
  }
}
