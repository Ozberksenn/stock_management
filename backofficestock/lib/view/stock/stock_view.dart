import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/core/widget/radius.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
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
      const StockMenuTitle(),
      const CustomSizedBox.paddingHeight(heightValue: 2),
      TabBarWidget(stockProvider: stockProvider),
      const CustomSizedBox.paddingHeight(heightValue: 10),
      Expanded(
        child: ListView.separated(
            shrinkWrap: true,
            itemCount: 50,
            separatorBuilder: (context, index) {
              return const CustomSizedBox.paddingHeight(heightValue: 16.0);
            },
            itemBuilder: (context, index) {
              return const StockProductCard();
            }),
      ),
    ]);
  }
}

class StockMenuTitle extends StatelessWidget {
  const StockMenuTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const ConstEdgeInsets.padding8(),
      decoration: BoxDecoration(
          color: AppColors.lightGrey, borderRadius: CustomRadius.radius6),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Menu Tab Name',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'Menu Tab Description buraya gelecek ve burada yer alacak',
                style: AppFonts.greylabelSmall,
              )
            ]),
        const CustomIcon(icon: Iconsax.edit)
      ]),
    );
  }
}
