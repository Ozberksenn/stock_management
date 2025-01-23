import 'package:flutter/material.dart';

import '../../../core/widget/padding.dart';
import '../../../product/constants/api_constants.dart';
import '../stock_provider.dart';
import 'menu_card.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
    required this.stockProvider,
  });

  final StockProvider stockProvider;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabAlignment: TabAlignment.start,
      dividerHeight: 0.1,
      dividerColor: AppColors.white,
      indicatorColor: AppColors.primaryColor,
      isScrollable: true,
      labelPadding: const ConstEdgeInsets.paddingOnly(right: 12.0),
      tabs: stockProvider.menuTabList
          .map((e) => MenuTab(text: e.menuName))
          .toList(),
      onTap: (value) =>
          stockProvider.handleTab(stockProvider.menuTabList[value]),
      controller: stockProvider.tabController,
    );
  }
}
