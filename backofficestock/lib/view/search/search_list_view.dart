import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/model/product_model.dart';
import 'package:backofficestock/product/utils/undefined/no_item_widget.dart';
import 'package:backofficestock/view/home/home_proivder.dart';
import 'package:backofficestock/view/stock/stock_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../product/utils/modal/custom_dialog.dart';
import '../form/form_view.dart';

class SearchListView extends StatelessWidget {
  final Widget? widget;
  const SearchListView({super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    HomeProivder provider = context.watch<HomeProivder>();
    StockProvider stockProvider = context.read<StockProvider>();
    void handleCard(ProductModel product) {
      customDialog(context,
          widget: FormView(
              dialogContext: context,
              edit: true,
              route: "product",
              title: "Product",
              apiUrl: "/updateProduct",
              provider: stockProvider,
              parameters: {
                "ID": product.id,
                "MENUID": stockProvider.selectedTab?.menuId
              },
              initialValue: product.toJson()));
    }

    return provider.searchList.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: provider.searchList.length,
            itemBuilder: (context, index) {
              return Card(
                color: AppColors.lightGrey,
                margin:
                    const ConstEdgeInsets.paddingSymetric(verticalPad: 12.0),
                child: ListTile(
                  onTap: () => handleCard(provider.searchList[index]),
                  title: Text(provider.searchList[index].productName),
                  subtitle: Text(provider.searchList[index].barcode),
                  trailing: Text(
                      "Quantity : ${provider.searchList[index].quantity} "),
                ),
              );
            })
        : CustomExpanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const NoItemWidget(),
                Text(
                  "Not Found Any Item",
                  style: Theme.of(context).textTheme.headlineSmall,
                )
              ],
            ),
          );
  }
}
