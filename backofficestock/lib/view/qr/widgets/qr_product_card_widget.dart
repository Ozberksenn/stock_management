import 'package:backofficestock/product/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import '../../../core/widget/padding.dart';
import '../../../core/widget/radius.dart';
import '../../../product/constants/api_constants.dart';
import '../../../product/model/product_model.dart';

class QrProductCard extends StatelessWidget {
  final ProductModel? product;
  const QrProductCard({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => customDialog(context, widget: DialogProductCard()),
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
                    Text(product?.productName ?? "",
                        style: Theme.of(context).textTheme.titleMedium),
                    Text(product?.price.toString() ?? "0",
                        style: AppFonts.boldSmall),
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

class DialogProductCard extends StatelessWidget {
  const DialogProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
// Transform.scale(scale: 0.6, child: const SwitchWidget())
