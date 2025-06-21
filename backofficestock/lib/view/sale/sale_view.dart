import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/widgets/custom_page.dart';
import 'package:backofficestock/view/home/home_proivder.dart';
import 'package:backofficestock/view/sale/sale_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home/widgets/content_header.dart';
import 'widgets/basket_Widget.dart';
import 'widgets/sale_content_widget.dart';

class SaleView extends StatelessWidget {
  const SaleView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.read<HomeProivder>();
    return ChangeNotifierProvider(
        create: (_) => SaleProvider(),
        builder: (context, child) {
          return CustomPage(
              isLoading: true,
              widget: Column(children: [
                ContentHeader(
                  title: homeProvider.menu.title ?? "",
                  searchBar: false,
                ),
                const CustomSizedBox.paddingHeight(heightValue: 8.0),
                CustomExpanded(
                  child: Card(
                    elevation: 5,
                    color: AppColors.white,
                    child: Row(children: [
                      const SaleContent(),
                      Container(
                        width: 0.5,
                        color: AppColors.lightGrey,
                      ),
                      const BasketWidget()
                    ]),
                  ),
                )
              ]));
        });
  }
}
