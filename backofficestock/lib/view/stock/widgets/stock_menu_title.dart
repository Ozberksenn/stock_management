import 'package:backofficestock/product/widgets/custom_dialog.dart';
import 'package:backofficestock/view/form/form_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../core/widget/padding.dart';
import '../../../core/widget/radius.dart';
import '../../../product/constants/api_constants.dart';
import '../../../product/widgets/custom_icon.dart';
import '../stock_provider.dart';

class StockMenuTitle extends StatelessWidget {
  final StockProvider provider;
  const StockMenuTitle({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return provider.selectedTab != null
        ? Container(
            padding: const ConstEdgeInsets.padding8(),
            decoration: BoxDecoration(
                color: AppColors.lightGrey, borderRadius: CustomRadius.radius6),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          provider.selectedTab?.menuName ?? "",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          provider.selectedTab?.menuDescription ?? "",
                          style: AppFonts.greylabelSmall,
                        )
                      ]),
                  Row(
                    children: [
                      CustomIcon(
                        icon: Iconsax.edit,
                        onTap: () => customDialog(context,
                            widget: FormView(
                              apiUrl: "/updateMenu",
                              dialogContext: context,
                              route: "menu",
                              title: 'Menu Edit',
                              initialValue: provider.selectedTab?.toJson(),
                              edit: true,
                              parameters: {
                                "MENUID": provider.selectedTab?.menuId
                              },
                            )),
                      ),
                      CustomIcon(
                          icon: CupertinoIcons.delete,
                          color: AppColors.error,
                          onTap: () => provider.deleteMenu())
                    ],
                  )
                ]),
          )
        : const SizedBox();
  }
}
