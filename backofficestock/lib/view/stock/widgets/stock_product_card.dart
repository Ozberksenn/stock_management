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
import '../../../product/constants/api_constants.dart';
import '../../../product/editors/switch.dart';
import '../../../product/model/custom_response.dart';
import '../../../product/utils/modal/custom_dialog.dart';
import '../../../product/widgets/snackbar_widgets.dart';

class StockProductCard extends StatelessWidget {
  final ProductModel product;
  final bool isDeleteIcon;
  const StockProductCard(
      {super.key, required this.product, required this.isDeleteIcon});

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
              "ProductId": product.id,
              "MenuId": stockProvider.selectedTab?.menuId
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

    void visibleProduct(value) async {
      ApiResponse response =
          await AppService.instance.putData("/updateProduct", {
        "ProductName": product.productName,
        "ProductId": product.id,
        "MenuId": product.menuId,
        "Barcode": product.barcode,
        "ShowStore": value,
      });
      if (response.success == true) {
        stockProvider.getProduct();
      } else {
        errorSnackbar(context: context, message: response.message);
      }
    }

    return GestureDetector(
      onTap: () => handleCard(),
      child: Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(
                  left: BorderSide(
                      width: 3,
                      color: product.quantity < 3
                          ? AppColors.red
                          : AppColors.primaryColor)),
              boxShadow: const []),
          padding: const ConstEdgeInsets.padding12(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    product.image != null && product.image != ""
                        ? Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "${AppService.cdnUrl}/${product.image}"))),
                          )
                        : const NoImage(
                            width: 100,
                            size: 36,
                          ),
                    const CustomSizedBox.paddingWidth(widthValue: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text(
                              '${product.productName} - ${product.price} TL',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Container(
                              height: 16,
                              padding: const ConstEdgeInsets.paddingOnly(
                                  left: 12.0, bottom: 2.0),
                              child: SwitchWidget(
                                  value: product.showStore ?? true,
                                  onChanged: (value) => visibleProduct(value)),
                            )
                          ]),
                          Text("Quantity: ${product.quantity}",
                              style: Theme.of(context).textTheme.titleSmall),
                          SizedBox(
                            child: Text(product.productDescription ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppFonts.greylabelSmall),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              CustomPaddings.customPadding(
                  value: 6,
                  child: isDeleteIcon == false
                      ? CustomIcon(
                          icon: Iconsax.trash,
                          color: AppColors.red,
                          onTap: () => handleDelete())
                      : const SizedBox())
            ],
          )),
    );
  }
}
