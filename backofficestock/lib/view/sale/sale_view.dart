import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/core/widget/radius.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/view/home/home_proivder.dart';
import 'package:backofficestock/view/sale/sale_provider.dart';
import 'package:flutter/cupertino.dart';
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
          return Column(children: [
            ContentHeader(
              title: homeProvider.menu.title ?? "",
            ),
            const CustomSizedBox.paddingHeight(heightValue: 8.0),
            CustomExpanded(
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: CustomRadius.radius12),
                child: Row(children: [
                  const SaleContent(),
                  Container(
                    width: 2,
                    color: AppColors.white,
                  ),
                  const BasketWidget()
                ]),
              ),
            )
          ]);
        });
  }
}
