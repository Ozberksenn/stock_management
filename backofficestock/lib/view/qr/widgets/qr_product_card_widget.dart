import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:backofficestock/product/editors/switch.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:backofficestock/product/utils/modal/custom_dialog.dart';
import 'package:backofficestock/product/widgets/snackbar_widgets.dart';
import 'package:backofficestock/view/stock/stock_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widget/padding.dart';
import '../../../core/widget/radius.dart';
import '../../../product/constants/api_constants.dart';
import '../../../product/model/product_model.dart';
import 'dialog_qr_product_card_widget.dart';

class QrProductCard extends StatelessWidget {
  final ProductModel? product;
  const QrProductCard({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    StockProvider provider = context.read<StockProvider>();

    void visibleProduct(value) async {
      Response response = await AppService.instance.putData("/updateProduct", {
        "PRODUCTNAME": product?.productName,
        "ID": product?.id,
        "MENUID": product?.menuId,
        "SHOWSTORE": value,
      });
      if (response.statusCode == 200) {
        provider.getProduct();
      } else {
        errorSnackbar(context: context, message: response.statusMessage);
      }
    }

    return InkWell(
      onTap: () => product != null
          ? customDialog(context,
              width: context.dynamicWidth(0.7),
              widget: DialogProductCard(product: product!))
          : null,
      child: Container(
        margin: const ConstEdgeInsets.paddingSymetric(verticalPad: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            product?.image != null && product?.image != ""
                ? Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                        borderRadius: CustomRadius.radius6,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "${AppService.cdnUrl}/${product?.image}"))))
                : const SizedBox(),
            const CustomSizedBox.paddingWidth(
              widthValue: 8,
            ),
            CustomExpanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(product?.productName ?? "",
                              style: Theme.of(context).textTheme.titleMedium),
                          const CustomSizedBox.paddingWidth(widthValue: 12.0),
                          Text("${product?.price.toString() ?? "0"}TL ",
                              style: AppFonts.boldSmall),
                        ]),
                        Text(product?.productDescription ?? "",
                            style: Theme.of(context).textTheme.labelSmall)
                      ]),
                  SwitchWidget(
                      value: product?.showStore ?? true,
                      onChanged: (value) => visibleProduct(value))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Transform.scale(scale: 0.6, child: const SwitchWidget())
