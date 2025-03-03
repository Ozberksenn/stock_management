import 'package:backofficestock/product/model/product_model.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:backofficestock/product/utils/modal/custom_alert_dialog.dart';
import 'package:backofficestock/product/utils/undefined/no_image_widget.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:backofficestock/view/form/form_view.dart';
import 'package:backofficestock/view/stock/stock_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../../core/widget/padding.dart';
import '../../../core/widget/radius.dart';
import '../../../product/constants/api_constants.dart';
import '../../../product/utils/modal/custom_dialog.dart';

class StockProductCard extends StatelessWidget {
  final ProductModel product;
  const StockProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    StockProvider stockProvider = context.read<StockProvider>();

    void handleCard() {
      customDialog(context,
          widget: FormView(
            dialogContext: context,
            edit: true,
            route: "product",
            title: "Product",
            apiUrl: "/updateProduct",
            provider: stockProvider,
            parameters: {
              "ID": product.id,
              "MENUID": stockProvider.selectedTab?.menuId
            },
            initialValue: product.toJson(),
          ));
    }

    void handleDelete() {
      customAlertDialog(
          context: context,
          onPressed: () {
            stockProvider.deleteProduct(product.id, context);
            context.pop();
          },
          title: "Product Delet",
          text: "Delete The Product ?");
    }

    return GestureDetector(
      onTap: () => handleCard(),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: CustomRadius.radius8,
              color: AppColors.white,
              border: Border(
                  left: BorderSide(
                      width: 3,
                      color: product.count! < 3
                          ? AppColors.red
                          : AppColors.primaryColor)),
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
                  product.image != null && product.image != ""
                      ? Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "${AppService.cdnUrl}/${product.image}"))),
                        )
                      : const NoImage(
                          width: 60,
                          size: 36,
                        ),
                  const CustomSizedBox.paddingWidth(widthValue: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${product.count} - ${product.productName}',
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
                      onTap: () => handleDelete()))
            ],
          )),
    );
  }
}
