import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/view/check/check_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../product/widgets/custom_icon.dart';

class CheckOrder extends StatelessWidget {
  const CheckOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckProvider>(
      builder: (context, provider, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            provider.selectedTable?.products?.isNotEmpty ?? false
                ? ListView.builder(
                    itemCount: provider.selectedTable?.products?.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CustomIcon(
                          icon: CupertinoIcons.delete,
                          size: 14.0,
                          color: AppColors.red,
                          onTap: () => provider.removeTableProdcut(
                              provider.selectedTable!.products![index],
                              index,
                              context),
                        ),
                        title: Text(provider
                                .selectedTable?.products?[index].productName ??
                            ""),
                        trailing: Text(
                          "${provider.selectedTable?.products?[index].price.toString() ?? ""} TL",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      );
                    })
                : const SizedBox()
          ],
        );
      },
    );
  }
}
