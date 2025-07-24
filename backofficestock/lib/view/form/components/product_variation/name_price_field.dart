import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/widget/padding.dart';

class NamePriceField extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController barcodeController;
  final TextEditingController quantityController;
  final dynamic Function()? handleDelete;
  final void Function(PointerDownEvent) onTapOutside;
  const NamePriceField(
      {super.key,
      required this.nameController,
      required this.priceController,
      required this.barcodeController,
      required this.quantityController,
      required this.onTapOutside,
      this.handleDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const ConstEdgeInsets.paddingOnly(top: 8.0),
      child: Row(children: [
        CustomIcon(
          icon: CupertinoIcons.trash,
          color: AppColors.error,
          onTap: handleDelete,
        ),
        const CustomSizedBox.paddingWidth(widthValue: 16.0),
        CustomExpanded(
            flex: 3,
            child: TextFormField(
              decoration: const InputDecoration(labelText: "Product Name"),
              controller: nameController,
            )),
        const CustomSizedBox.paddingWidth(widthValue: 4.0),
        CustomExpanded(
            flex: 1,
            child: TextFormField(
              decoration: const InputDecoration(labelText: "Barcode"),
              controller: barcodeController,
              onTapOutside: onTapOutside,
            )),
        const CustomSizedBox.paddingWidth(widthValue: 4.0),
        CustomExpanded(
            flex: 1,
            child: TextFormField(
              decoration: const InputDecoration(labelText: "quantity"),
              controller: quantityController,
              onTapOutside: onTapOutside,
            )),
        const CustomSizedBox.paddingWidth(widthValue: 4.0),
        CustomExpanded(
            flex: 1,
            child: TextFormField(
              decoration: const InputDecoration(labelText: "Price"),
              controller: priceController,
              onTapOutside: onTapOutside,
            ))
      ]),
    );
  }
}
