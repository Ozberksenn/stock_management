import 'package:backofficestock/core/widget/padding.dart';
import 'package:flutter/material.dart';
import 'stock_provider.dart';
import 'widgets/stock_product_card.dart';
import 'widgets/tab_bar_widget.dart';

class StockView extends StatefulWidget {
  const StockView({super.key});

  @override
  State<StockView> createState() => _StockViewState();
}

class _StockViewState extends State<StockView>
    with SingleTickerProviderStateMixin {
  late StockProvider stockProvider;

  @override
  void initState() {
    super.initState();
    stockProvider = StockProvider(this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const CustomSizedBox.paddingHeight(heightValue: 10),
      TabBarWidget(stockProvider: stockProvider),
      const CustomSizedBox.paddingHeight(heightValue: 10),
      ListView.builder(
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (context, index) {
            return const StockProductCard();
          }),
    ]);
  }
}
