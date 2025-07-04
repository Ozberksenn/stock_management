import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/core/widget/radius.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/view/check/check_view.dart';
import 'package:backofficestock/view/company/company_view.dart';
import 'package:backofficestock/view/home/home_proivder.dart';
import 'package:backofficestock/view/home/widgets/navigation_bar.dart';
import 'package:backofficestock/view/qr/qr_view.dart';
import 'package:backofficestock/view/reports/reports_view.dart';
import 'package:backofficestock/view/sale/sale_view.dart';
import 'package:backofficestock/view/stock/stock_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../web_site/web_site_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeProivder homeProivder = context.watch();
    return Scaffold(
        body: Container(
      width: context.dynamicWidth(1),
      height: context.dynamicHeight(1),
      color: AppColors.black,
      child: Row(
        children: [
          const CustomExpanded(flex: 1, child: NavigationBarWidget()),
          CustomExpanded(
              flex: 5,
              child: CustomPaddings.customPadding(
                  value: 20,
                  child: Container(
                      height: context.dynamicHeight(1),
                      padding: const ConstEdgeInsets.padding12(),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: CustomRadius.radius16),
                      child: content(homeProivder.menu.id))))
        ],
      ),
    ));
  }
}

content(int menuId) {
  switch (menuId) {
    case 1:
      return const StockView();
    case 2:
      return const QrView();
    case 3:
      return const SaleView();
    case 4:
      return const WebSiteView();
    case 5:
      return const ReportsView();
    case 6:
      return const CompanyView();
    case 7:
      return const CheckView();
    default:
      return Container();
  }
}
