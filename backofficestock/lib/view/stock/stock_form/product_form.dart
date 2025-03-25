import 'dart:convert';

import 'package:backofficestock/product/editors/form_image_picker_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../core/widget/padding.dart';
import '../../../product/editors/form_text_field.dart';
import '../../form/components/product_variation/product_variation_widget.dart';
import '../../form/widgets/form_label.dart';

class ProductForm extends StatelessWidget {
  final Map<String, dynamic>? initialValue;
  const ProductForm({super.key, this.initialValue});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dataList = List<Map<String, dynamic>>.from(
        jsonDecode(initialValue?['PRODUCTVARIATION'] ?? "[]"));
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FormImagePicker(),
          const CustomSizedBox.paddingHeight(heightValue: 8),
          const FormLabel(text: "Product Name"),
          FormTextField(
            name: "PRODUCTNAME",
            validator: FormBuilderValidators.required(),
          ),
          const CustomSizedBox.paddingHeight(heightValue: 8),
          const FormLabel(text: "Product Description"),
          const FormTextField(name: "PRODUCTDESCRIPTION", maxLines: 3),
          const CustomSizedBox.paddingHeight(heightValue: 8),
          const FormLabel(text: "Barcode"),
          FormTextField(
              name: "BARCODE",
              maxLines: 1,
              validator: FormBuilderValidators.required()),
          const CustomSizedBox.paddingHeight(heightValue: 8),
          Row(children: [
            CustomExpanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FormLabel(text: "Price"),
                    FormTextField(
                      name: "PRICE",
                      postDataType: "double",
                      validator: FormBuilderValidators.numeric(),
                    ),
                  ]),
            ),
            const CustomSizedBox.paddingWidth(widthValue: 12.0),
            CustomExpanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FormLabel(text: "Count"),
                  FormTextField(
                    name: "COUNT",
                    postDataType: "int",
                    validator: FormBuilderValidators.numeric(),
                  ),
                ],
              ),
            )
          ]),
          const CustomSizedBox.paddingHeight(heightValue: 16),
          ProductVariation(
              fieldName: "PRODUCTVARIATION",
              // nameInitialValue: "",
              // priceInitialValue: "",
              variationList: dataList)
        ]);
  }
}
