import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/utils/modal/warning_popup.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:backofficestock/view/home/home_proivder.dart';
import 'package:backofficestock/view/search/search_list_view.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../home/widgets/content_header.dart';
import 'stock_provider.dart';
import 'widgets/product_list_widget.dart';
import 'widgets/stock_add_button.dart';
import 'widgets/stock_menu_title.dart';
import 'widgets/tab_bar_widget.dart';

class StockView extends StatefulWidget {
  const StockView({super.key});
  @override
  State<StockView> createState() => _StockViewState();
}

class _StockViewState extends State<StockView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StockProvider(),
      builder: (context, child) {
        final stockProvider = context.watch<StockProvider>();
        final homeProvider = context.watch<HomeProivder>();
        stockProvider.init(tabVsync: this, context: context);
        Widget stockContent(StockProvider stockProvider) {
          return CustomExpanded(
            child: Column(
              children: [
                const CustomSizedBox.paddingHeight(heightValue: 10),
                stockProvider.isMenuReady == true &&
                        stockProvider.menuTabList.isNotEmpty
                    ? StockMenuTitle(provider: stockProvider)
                    : const SizedBox(),
                stockProvider.isMenuReady == true
                    ? TabBarWidget(stockProvider: stockProvider)
                    : const SizedBox(),
                const CustomSizedBox.paddingHeight(heightValue: 10),
                ProductsList(stockProvider: stockProvider),
              ],
            ),
          );
        }

        return Column(children: [
          ContentHeader(
              title: homeProvider.menu.title ?? "",
              widget: Row(
                children: [
                  CustomIcon(
                    icon: Iconsax.import,
                    size: 20,
                    onTap: () => warningPopup(context,
                        message: "This service is currently unavailable"),
                  ),
                  const CustomSizedBox.paddingWidth(widthValue: 12.0),
                  StockAddButton(stockProvider: stockProvider)
                ],
              )),
          homeProvider.searchText.length > 1
              ? const SearchListView()
              : stockContent(stockProvider)
        ]);
      },
    );
  }
}
