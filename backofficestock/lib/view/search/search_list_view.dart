import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/utils/undefined/no_item_widget.dart';
import 'package:backofficestock/view/home/home_proivder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchListView extends StatelessWidget {
  final Widget? widget;
  const SearchListView({super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    HomeProivder provider = context.watch<HomeProivder>();
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
                  title: Text(provider.searchList[index]['PRODUCTNAME']),
                  subtitle: Text(provider.searchList[index]['BARCODE']),
                  trailing: Text(
                      "Quantity : ${provider.searchList[index]['COUNT']} "),
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
