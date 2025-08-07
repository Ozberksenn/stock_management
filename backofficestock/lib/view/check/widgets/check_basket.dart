import 'package:backofficestock/product/widgets/custom_elevated_button.dart';
import 'package:backofficestock/view/check/check_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widget/padding.dart';
import '../../../core/widget/radius.dart';
import '../../../product/constants/api_constants.dart';
import '../../../product/widgets/custom_icon.dart';

class CheckBasket extends StatelessWidget {
  const CheckBasket({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CheckProvider provider = context.watch();
    return CustomExpanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.softGrey, borderRadius: CustomRadius.radius8),
        child: provider.selectedTable == null
            ? const Align(alignment: Alignment.center, child: Text("Basket..."))
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomExpanded(
                    child: Column(children: [
                      ListTile(
                        title:
                            Text("Table : ${provider.selectedTable?.tableNo}"),
                        subtitle:
                            Text(provider.selectedTable?.customerName ?? ""),
                        trailing: Text(provider.selectedTable?.status ?? ""),
                      ),
                      const CustomSizedBox.paddingHeight(heightValue: 8.0),
                      const Divider(),
                      CustomExpanded(
                          child: provider.selectedTable?.products?.isNotEmpty ??
                                  false
                              ? ListView.builder(
                                  itemCount:
                                      provider.selectedTable?.products?.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    var item = provider.selectedTable?.products;
                                    if (item![index].variants!.isNotEmpty) {
                                      return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount:
                                              item[index].variants?.length,
                                          itemBuilder: (context, variantIndex) {
                                            return checkBasketItem(
                                                item[index]
                                                    .variants![variantIndex]
                                                    .variantName,
                                                item[index]
                                                    .variants![variantIndex]
                                                    .price,
                                                context,
                                                onTap: () =>
                                                    provider.removeTableProdcut(
                                                        item[index],
                                                        index,
                                                        context));
                                          });
                                    } else {
                                      return checkBasketItem(
                                        item[index].productName,
                                        item[index].price,
                                        context,
                                        onTap: () =>
                                            provider.removeTableProdcut(
                                                item[index], index, context),
                                      );
                                    }
                                  })
                              : const SizedBox())
                    ]),
                  ),
                  const CustomSizedBox.paddingHeight(heightValue: 12.0),
                  checkBasketFooter(context)
                ],
              ),
      ),
    );
  }

  Widget checkBasketItem(String name, double price, BuildContext context,
      {dynamic Function()? onTap}) {
    return ListTile(
      leading: CustomIcon(
          icon: CupertinoIcons.delete,
          size: 14.0,
          color: AppColors.red,
          onTap: onTap
          // provider.removeTableProdcut(item[index], index, context),
          ),
      title: Text(name),
      trailing: Text(
        "${price.toString()} TL",
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget checkBasketFooter(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.reservedCardColor,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8.0))),
      height: 60,
      padding: const ConstEdgeInsets.paddingHorizontal12(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "1050 TL",
            style: AppFonts.whiteBodyMedium,
          ),
          const CustomElevatedButton(text: "Completed")
        ],
      ),
    );
  }
}
