import 'package:backofficestock/core/decoration/decoration.dart';
import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:backofficestock/product/editors/form_text_field.dart';
import 'package:backofficestock/product/utils/undefined/no_image_widget.dart';
import 'package:backofficestock/view/sale/sale_provider.dart';
import 'package:backofficestock/view/sale/widgets/no_product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widget/padding.dart';

class SaleContent extends StatelessWidget {
  const SaleContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SaleProvider provider = context.watch<SaleProvider>();
    return CustomExpanded(
        flex: 1,
        child: Padding(
          padding: const ConstEdgeInsets.padding8(),
          child: Column(
            children: [
              const CustomSizedBox.paddingHeight(heightValue: 8.0),
              FormTextField(
                name: "",
                hintText: "Barcode No",
                suffixIcon: IconButton(
                    onPressed: () => provider.searchBarcode(),
                    icon: const Icon(CupertinoIcons.search)),
                textEditingController: provider.barcodeTextController,
              ),
              const CustomSizedBox.paddingHeight(heightValue: 30.0),
              provider.isReady == true
                  ? CustomExpanded(child: SaleProductCard(provider: provider))
                  : const NoProductWidget()
            ],
          ),
        ));
  }
}

class SaleProductCard extends StatelessWidget {
  final SaleProvider provider;
  const SaleProductCard({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      provider.productFounded?.image != null &&
              provider.productFounded?.image != ""
          ? Container(
              width: context.dynamicWidth(1),
              height: context.dynamicHeight(0.20),
              decoration: CustomDecoration.radiusImageDecoration(
                  NetworkImage(provider.productFounded!.image.toString())),
            )
          : NoImage(
              width: context.dynamicWidth(1),
              height: context.dynamicHeight(0.20),
            ),
      ListTile(
        contentPadding: const ConstEdgeInsets.padding0(),
        title: Text(provider.productFounded?.productName ?? ""),
        subtitle: Text(provider.productFounded?.barcode ?? ""),
        trailing: Text("Quantity: ${provider.productFounded?.count}"),
      ),
      const CustomSizedBox.paddingHeight(heightValue: 8.0),
    ]);

    // Container(
    //   decoration: const BoxDecoration(
    //     color: AppColors.white,
    //     borderRadius: BorderRadius.all(Radius.circular(12.0)),
    //   ),
    //   padding: const ConstEdgeInsets.padding8(),
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       CustomExpanded(
    //           child: provider.productFounded?.image != null &&
    //                   provider.productFounded?.image != ""
    //               ? Container(
    //                   height: context.dynamicHeight(0.20),
    //                   decoration: CustomDecoration.radiusImageDecoration(
    //                       NetworkImage(
    //                           provider.productFounded!.image.toString())),
    //                 )
    //               : Container(
    //                   height: context.dynamicHeight(0.20),
    //                   decoration: CustomDecoration.radiusImageDecoration(
    //                       const AssetImage("assets/images/login.jpg")))),
    //       const CustomSizedBox.paddingWidth(widthValue: 12.0),
    //       CustomExpanded(
    //           flex: 2,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Text(
    //                     "${provider.productFounded?.productName} - ${provider.productFounded?.count}",
    //                     style: Theme.of(context).textTheme.titleMedium,
    //                   ),
    //                   Text(
    //                     "${provider.productFounded?.price ?? ""} TL",
    //                     style: Theme.of(context).textTheme.titleMedium,
    //                   )
    //                 ],
    //               ),
    //               const CustomSizedBox.paddingHeight(
    //                 heightValue: 4.0,
    //               ),
    //               Text(provider.productFounded?.productDescription ?? "",
    //                   style: Theme.of(context).textTheme.bodyMedium),
    //             ],
    //           )),
    //     ],
    //   ),
    // );
  }
}
