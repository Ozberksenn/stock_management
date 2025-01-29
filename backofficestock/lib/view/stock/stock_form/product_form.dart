import 'package:flutter/material.dart';

import '../../../core/widget/padding.dart';
import '../../../product/editors/form_text_field.dart';
import '../../form/widgets/form_label.dart';

class ProductForm extends StatelessWidget {
  const ProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormLabel(text: "Product Name"),
          FormTextField(name: "PRODUCTNAME"),
          CustomSizedBox.paddingHeight(heightValue: 8),
          FormLabel(text: "Product Description"),
          FormTextField(name: "PRODUCTDESCRIPTION", maxLines: 3),
          CustomSizedBox.paddingHeight(heightValue: 8),
          FormLabel(text: "Price"),
          FormTextField(
            name: "PRICE",
          ),
          CustomSizedBox.paddingHeight(heightValue: 8),
          FormLabel(text: "Count"),
          FormTextField(name: "COUNT"),
          CustomSizedBox.paddingHeight(heightValue: 8),
          FormLabel(text: "Image Url"),
          FormTextField(name: "IMAGE"),
        ]);
  }
}
