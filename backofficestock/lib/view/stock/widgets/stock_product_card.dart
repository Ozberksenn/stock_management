import 'package:backofficestock/product/model/product_model.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:backofficestock/view/form/form_view.dart';
import 'package:backofficestock/view/stock/stock_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../../core/widget/padding.dart';
import '../../../core/widget/radius.dart';
import '../../../product/constants/api_constants.dart';
import '../../../product/widgets/custom_dialog.dart';

class StockProductCard extends StatelessWidget {
  final ProductModel product;
  const StockProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    StockProvider stockProvider = context.read<StockProvider>();
    return GestureDetector(
      onTap: () => customDialog(context,
          widget: FormView(
            dialogContext: context,
            edit: true,
            route: "product",
            title: "Product",
            apiUrl: "/updateProduct",
            parameters: {
              "ID": product.id,
              "MENUID": stockProvider.selectedTab?.menuId
            },
            initialValue: product.toJson(),
          )),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: CustomRadius.radius8,
              color: AppColors.white,
              border: const Border(
                  left: BorderSide(width: 3, color: AppColors.primaryColor)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ]),
          padding: const ConstEdgeInsets.padding6(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(AppString.custumProductUrl))),
                  ),
                  const CustomSizedBox.paddingWidth(widthValue: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${product.productName} - ${product.price}TL',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(product.productDescription ?? '',
                          style: AppFonts.greylabelSmall)
                    ],
                  )
                ],
              ),
              CustomPaddings.customPadding(
                  value: 6,
                  child: CustomIcon(
                    icon: Iconsax.trash,
                    color: AppColors.red,
                    onTap: () {
                      stockProvider.deleteProduct(product.id, context);
                    },
                  ))
            ],
          )),
    );
  }
}
