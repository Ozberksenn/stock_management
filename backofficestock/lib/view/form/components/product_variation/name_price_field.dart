import 'package:flutter/material.dart';
import '../../../../core/widget/padding.dart';

class NamePriceField extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController priceController;
  final String? nameInitialValue;
  final String? priceInitialValue;
  final void Function(PointerDownEvent) onTapOutside;
  const NamePriceField({
    super.key,
    required this.nameController,
    required this.priceController,
    required this.onTapOutside,
    this.nameInitialValue,
    this.priceInitialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const ConstEdgeInsets.paddingOnly(top: 8.0),
      child: Row(children: [
        CustomExpanded(
            flex: 6,
            child: TextFormField(
              controller: nameController,
              initialValue: nameInitialValue,
            )),
        const CustomSizedBox.paddingWidth(widthValue: 16.0),
        CustomExpanded(
            flex: 1,
            child: TextFormField(
              controller: priceController,
              onTapOutside: onTapOutside,
              initialValue: priceInitialValue,
            ))
      ]),
    );
  }
}
