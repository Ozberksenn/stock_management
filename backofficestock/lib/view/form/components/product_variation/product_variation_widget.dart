import 'dart:convert';

import 'package:backofficestock/view/form/components/product_variation/product_variation_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import '../../../../product/constants/api_constants.dart';
import '../../../../product/widgets/custom_icon.dart';
import 'name_price_field.dart';

class ProductVariation extends StatelessWidget {
  final String fieldName;
  final List<Map<String, dynamic>>? variationList;
  const ProductVariation(
      {super.key, required this.fieldName, this.variationList});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ProductVariationProvider(variationList ?? [{}]),
        builder: (context, child) {
          final provider = Provider.of<ProductVariationProvider>(context);
          return Column(children: [
            InkWell(
              onTap: () => provider.addVariation(),
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
                        nameController: provider.variationsList[index]
                            ['nameTextEditingController'],
                        priceController: provider.variationsList[index]
                            ['priceTextEditingController'],
                        handleDelete: () {
                          provider.removeVaration(index);
                          List<Map<String, dynamic>> variations =
                              provider.variationsList.map((e) {
                            return {
                              "name": e['nameTextEditingController'].text,
                              "price": e['priceTextEditingController'].text
                            };
                          }).toList();
                          field.didChange(jsonEncode(variations).toString());
                        },
                        onTapOutside: (p0) {
                          List<Map<String, dynamic>> variations =
                              provider.variationsList.map((e) {
                            return {
                              "name": e['nameTextEditingController'].text,
                              "price": e['priceTextEditingController'].text
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
