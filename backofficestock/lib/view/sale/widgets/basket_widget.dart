import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/widgets/custom_buttons.dart';
import 'package:backofficestock/product/widgets/custom_divider.dart';
import 'package:backofficestock/view/sale/sale_provider.dart';
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
                ? CustomExpanded(
                    child: ListView.builder(
                        itemCount: provider.productList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            // leading: Image.asset("name"),
                            title:
                                Text(provider.productList[index].productName),
                            subtitle: Text(provider
                                    .productList[index].productDescription ??
                                ""),
                          );
                        }),
                  )
                : CustomExpanded(
                    child: Text("No Product",
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
            CustomPaddings.customPadding(
              value: 8.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Text(
                      "\$ : 100",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const CustomSizedBox.paddingWidth(widthValue: 12.0),
                    Text("Count : 5",
                        style: Theme.of(context).textTheme.titleSmall),
                  ]),
                  CustomButton(
                    text: "Completed",
                    onTap: () => provider.sendProducts(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
