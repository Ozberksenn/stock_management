import 'package:backofficestock/product/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
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
    return InkWell(
      onTap: () => product != null
          ? customDialog(context, widget: DialogProductCard(product: product!))
          : null,
      child: Container(
        margin: const ConstEdgeInsets.paddingSymetric(verticalPad: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                  borderRadius: CustomRadius.radius6,
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppString.customProfileUrl))),
            ),
            const CustomSizedBox.paddingWidth(
              widthValue: 8,
            ),
            CustomExpanded(
              child: Column(
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
            )
          ],
        ),
      ),
    );
  }
}

// Transform.scale(scale: 0.6, child: const SwitchWidget())
