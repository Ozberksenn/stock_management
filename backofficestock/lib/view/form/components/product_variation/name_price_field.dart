import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/widget/padding.dart';

class NamePriceField extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController priceController;
  final dynamic Function()? handleDelete;
  final void Function(PointerDownEvent) onTapOutside;
  const NamePriceField(
      {super.key,
      required this.nameController,
      required this.priceController,
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
            flex: 6,
            child: TextFormField(
              controller: nameController,
            )),
        const CustomSizedBox.paddingWidth(widthValue: 16.0),
        CustomExpanded(
            flex: 1,
            child: TextFormField(
              controller: priceController,
              onTapOutside: onTapOutside,
            ))
      ]),
    );
  }
}
