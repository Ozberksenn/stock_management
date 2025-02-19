import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/editors/form_image_picker_field.dart';
import 'package:backofficestock/product/widgets/custom_divider.dart';
import 'package:backofficestock/view/sale/sale_provider.dart';
import 'package:backofficestock/view/sale/widgets/no_product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widget/padding.dart';
import '../../../product/widgets/custom_icon.dart';

class BasketWidget extends StatelessWidget {
  const BasketWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SaleProvider provider = context.watch<SaleProvider>();
    return CustomExpanded(
      child: Padding(
        padding: const ConstEdgeInsets.padding8(),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Sepet",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              trailing: const CustomIcon(icon: CupertinoIcons.xmark),
            ),
            const CustomDivider(
              color: AppColors.dark,
            ),
            provider.isReady == true
                ? ListView.builder(
                    itemCount: provider.productList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        // leading: Image.asset("name"),
                        title: Text(provider.productList[index].productName),
                        subtitle: Text(
                            provider.productList[index].productDescription ??
                                ""),
                      );
                    })
                : Text("No Product",
                    style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
      ),
    );
  }
}
