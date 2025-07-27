import 'dart:convert';
import 'package:backofficestock/view/form/components/product_variation/product_variation_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import '../../../../product/constants/api_constants.dart';
import '../../../../product/model/product_variation_model.dart';
import '../../../../product/widgets/custom_icon.dart';
import 'name_price_field.dart';

class ProductVariation extends StatelessWidget {
  final String fieldName;
  final String? mainBarcode;
  final List<ProductVariantModel>? variationList;
  const ProductVariation(
      {super.key,
      required this.fieldName,
      this.mainBarcode,
      this.variationList});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) =>
            ProductVariationProvider(variationList ?? [], mainBarcode ?? ""),
        builder: (context, child) {
          final provider = Provider.of<ProductVariationProvider>(context);
          return Column(children: [
            InkWell(
              onTap: () =>
                  provider.addVariation(provider.variationsList.length),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Add variation"),
                  CustomIcon(
                    icon: CupertinoIcons.add,
                    size: 18,
                    color: AppColors.dark,
                  )
                ],
              ),
            ),
            FormBuilderField(
              name: fieldName,
              builder: (field) {
                return ListView.builder(
                    itemCount: provider.variationsList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return NamePriceField(
                        onChanged: () {
                          List<Map<String, dynamic>> variations =
                              provider.variationsList.map((e) {
                            return {
                              "id": e['id'],
                              "name": e['nameTextEditingController'].text,
                              "barcode": e['barcodeTextEditingController'].text,
                              "price": e['priceTextEditingController'].text,
                              "quantity":
                                  e['quantityTextEditingController'].text,
                            };
                          }).toList();
                          field.didChange(jsonEncode(variations).toString());
                        },
                        nameController: provider.variationsList[index]
                            ['nameTextEditingController'],
                        barcodeController: provider.variationsList[index]
                            ['barcodeTextEditingController'],
                        quantityController: provider.variationsList[index]
                            ['quantityTextEditingController'],
                        priceController: provider.variationsList[index]
                            ['priceTextEditingController'],
                        handleDelete: () {
                          provider.removeVaration(index);
                          List<Map<String, dynamic>> variations =
                              provider.variationsList.map((e) {
                            return {
                              "id": e['id'],
                              "name": e['nameTextEditingController'].text,
                              "barcode": e['barcodeTextEditingController'].text,
                              "price": e['priceTextEditingController'].text,
                              "quantity":
                                  e['quantityTextEditingController'].text
                            };
                          }).toList();
                          field.didChange(jsonEncode(variations).toString());
                        },
                      );
                    });
              },
            )
          ]);
        });
  }
}
