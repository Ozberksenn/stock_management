import 'package:backofficestock/product/editors/form_dropdown_field.dart';
import 'package:backofficestock/product/model/product_model.dart';
import 'package:backofficestock/view/check/check_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../product/widgets/custom_icon.dart';

class CheckOrder extends StatelessWidget {
  final CheckProvider provider;
  final List<ProductModel> productList;
  const CheckOrder({
    super.key,
    required this.provider,
    required this.productList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Order Detail", style: Theme.of(context).textTheme.titleMedium),
          const CustomIcon(icon: CupertinoIcons.add_circled)
        ]),
        const Divider(),
        ListView.builder(
            itemCount: provider.selectedTable?.products?.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                title: FormDropdownField(
                    hintText:
                        provider.selectedTable?.products?[index].productName ??
                            "",
                    showSearchBox: true,
                    fieldName: "",
                    items: productList),
                //     provider.selectedTable?.products?[index].productName ?? ""),
                trailing: Text(
                  "${provider.selectedTable?.products?[index].price.toString() ?? ""} TL",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
            })
      ],
    );
  }
}
