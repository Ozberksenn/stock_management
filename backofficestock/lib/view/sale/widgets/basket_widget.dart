import 'package:backofficestock/core/widget/radius.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/model/product_model.dart';
import 'package:backofficestock/product/widgets/custom_buttons.dart';
import 'package:backofficestock/product/widgets/custom_divider.dart';
import 'package:backofficestock/view/sale/sale_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widget/padding.dart';
import '../../../product/widgets/custom_icon.dart';

class BasketWidget extends StatelessWidget {
  const BasketWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SaleProvider provider = context.watch<SaleProvider>();
    return CustomExpanded(
      child: Padding(
        padding: const ConstEdgeInsets.padding8(),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Basket",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              trailing: const CustomIcon(icon: CupertinoIcons.xmark),
            ),
            const CustomDivider(
              color: AppColors.dark,
            ),
            provider.isReady == true
                ? CustomExpanded(
                    child: ListView.builder(
                        itemCount: provider.productList.length,
                        itemBuilder: (context, index) {
                          return BasketCard(
                              product: provider.productList[index]);
                        }),
                  )
                : CustomExpanded(
                    child: Text("No Product",
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
            Container(
              margin: const ConstEdgeInsets.padding8(),
              padding: const ConstEdgeInsets.padding8(),
              decoration: BoxDecoration(
                  color: AppColors.white, borderRadius: CustomRadius.radius12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price: ${provider.totalPrice}TL",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  CustomButton(
                    text: "Completed",
                    onTap: () => provider.sendProducts(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BasketCard extends StatelessWidget {
  final ProductModel product;
  const BasketCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    SaleProvider provider = context.watch<SaleProvider>();
    return ListTile(
        leading: CustomIcon(
            onTap: () => provider.handleDelete(product),
            icon: CupertinoIcons.delete),
        title: Text(product.productName),
        subtitle: Text("Stock : ${product.price.toString()}"),
        trailing: Container(
          color: AppColors.white,
          width: 90,
          padding: const ConstEdgeInsets.padding2(),
          child: Row(
            children: [
              CustomIcon(
                onTap: () => provider.handleMinus(product),
                icon: CupertinoIcons.minus,
                size: 16,
              ),
              const CustomSizedBox.paddingWidth(widthValue: 20.0),
              Text(product.basketQuantity.toString(),
                  style: AppFonts.greenTitleMedium),
              const CustomSizedBox.paddingWidth(widthValue: 20.0),
              CustomIcon(
                onTap: () => provider.handlePlus(product),
                icon: CupertinoIcons.plus,
                size: 16,
              ),
            ],
          ),
        ));
  }
}
