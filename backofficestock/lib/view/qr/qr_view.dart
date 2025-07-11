import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/view/home/home_proivder.dart';
import 'package:backofficestock/view/search/search_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home/widgets/content_header.dart';
import '../stock/stock_provider.dart';
import '../stock/widgets/tab_bar_widget.dart';
import 'widgets/qr_menu_title_widget.dart';
import 'widgets/qr_product_list_view.dart';

class QrView extends StatefulWidget {
  const QrView({super.key});

  @override
  State<QrView> createState() => _QrViewState();
}

class _QrViewState extends State<QrView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StockProvider(),
      builder: (context, child) {
        final stockProvider = context.watch<StockProvider>();
        final homeProvider = context.watch<HomeProivder>();
        stockProvider.init(tabVsync: this);
        return Column(children: [
          ContentHeader(
            title: homeProvider.menu.title ?? "",
          ),
          Expanded(
              child: homeProvider.searchText.length > 1
                  ? const SearchListView()
                  : Column(
                      children: [
                        const CustomSizedBox.paddingHeight(heightValue: 10),
                        QrMenuTitle(selectedTab: stockProvider.selectedTab),
                        const CustomSizedBox.paddingHeight(heightValue: 10),
                        stockProvider.isMenuReady == true
                            ? TabBarWidget(stockProvider: stockProvider)
                            : const SizedBox(),
                        const CustomSizedBox.paddingHeight(heightValue: 10),
                        QrProductList(stockProvider: stockProvider)
                      ],
                    ))
        ]);
      },
    );
  }
}
