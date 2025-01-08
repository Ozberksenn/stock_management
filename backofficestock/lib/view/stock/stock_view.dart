import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/view/stock/widgets/menu_card.dart';
import 'package:flutter/material.dart';

import 'stock_provider.dart';

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
  void dispose() {
    stockProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const CustomSizedBox.paddingHeight(heightValue: 10),
      TabBar(
        tabAlignment: TabAlignment.start,
        dividerHeight: 0.1,
        dividerColor: AppColors.white,
        indicatorColor: AppColors.primaryColor,
        isScrollable: true,
        labelPadding: const ConstEdgeInsets.paddingOnly(right: 24.0),
        tabs: [
          MenuTab(),
          MenuTab(),
          MenuTab(),
          MenuTab(),
          MenuTab(),
          MenuTab(),
          MenuTab()
        ],
        controller: stockProvider.tabController,
      )
    ]);
  }
}
