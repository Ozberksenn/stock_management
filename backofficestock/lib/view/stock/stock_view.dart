import 'package:backofficestock/core/widget/padding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'stock_provider.dart';
import 'widgets/product_list_widget.dart';
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
        stockProvider.init(vsync: this);
        return Column(children: [
          const CustomSizedBox.paddingHeight(heightValue: 10),
          StockMenuTitle(provider: stockProvider),
          stockProvider.isMenuReady == true
              ? TabBarWidget(stockProvider: stockProvider)
              : const SizedBox(),
          const CustomSizedBox.paddingHeight(heightValue: 10),
          ProductsList(stockProvider: stockProvider),
        ]);
      },
    );
  }
}
