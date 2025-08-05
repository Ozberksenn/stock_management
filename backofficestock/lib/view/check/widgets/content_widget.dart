import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/core/widget/radius.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/view/check/widgets/check_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../product/widgets/custom_icon.dart';
import '../check_provider.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    CheckProvider checkProvider = context.watch<CheckProvider>();
    return CustomExpanded(
      child: Row(children: [
        checkProvider.tables.isNotEmpty
            ? CustomExpanded(
                flex: 3,
                child: GridView.builder(
                    itemCount: checkProvider.tables.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1.2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return CheckCard(table: checkProvider.tables[index]);
                    }),
              )
            : const SizedBox(),
        const CustomSizedBox.paddingWidth(widthValue: 12.0),
        CheckBasket()
      ]),
    );
  }
}

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
                                    return ListTile(
                                      leading: CustomIcon(
                                        icon: CupertinoIcons.delete,
                                        size: 14.0,
                                        color: AppColors.red,
                                        onTap: () =>
                                            provider.removeTableProdcut(
                                                provider.selectedTable!
                                                    .products![index],
                                                index,
                                                context),
                                      ),
                                      title: Text(provider.selectedTable
                                              ?.products?[index].productName ??
                                          ""),
                                      trailing: Text(
                                        "${provider.selectedTable?.products?[index].price.toString() ?? ""} TL",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    );
                                  })
                              : const SizedBox())
                    ]),
                  ),
                  const CustomSizedBox.paddingHeight(heightValue: 12.0),
                  Container(
                    decoration: const BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(8.0))),
                    height: 60,
                  )
                ],
              ),
      ),
    );
  }
}
