import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:backofficestock/product/editors/switch.dart';
import 'package:backofficestock/product/model/product_model.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:backofficestock/product/widgets/custom_divider.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widget/padding.dart';
import '../../../product/constants/api_constants.dart';

class DialogProductCard extends StatelessWidget {
  final ProductModel product;
  const DialogProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const ConstEdgeInsets.paddingHorizontal12(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SwitchWidget(),
              CustomIcon(
                  onTap: () => context.pop(), icon: CupertinoIcons.xmark),
            ],
          ),
        ),
        const CustomDivider(),
        Padding(
          padding: const ConstEdgeInsets.paddingHorizontal12(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: context.dynamicWidth(0.3),
                height: context.dynamicHeight(0.5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: product.image != null && product.image != ""
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "${AppService.cdnUrl}/${product.image}"))
                        : null),
              ),
              const CustomSizedBox.paddingWidth(widthValue: 12.0),
              CustomExpanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.productName,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text("27 TL", style: AppFonts.boldSmall)
                        ]),
                    Text(
                      "Count : ${product.count}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      product.productDescription ?? "",
                      maxLines: 8,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const CustomSizedBox.paddingHeight(heightValue: 12.0)
      ],
    );
  }
}
