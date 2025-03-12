import 'package:backofficestock/product/utils/modal/custom_alert_dialog.dart';
import 'package:backofficestock/product/widgets/popup_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/widget/padding.dart';
import '../../../core/widget/radius.dart';
import '../../../product/constants/api_constants.dart';
import '../../../product/utils/modal/custom_dialog.dart';
import '../../../product/widgets/custom_icon.dart';
import '../../form/form_view.dart';
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
                color: AppColors.softGrey, borderRadius: CustomRadius.radius6),
            child: provider.isMenuReady == true
                ? Row(
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
                        ActionIcon(provider: provider)
                      ])
                : const SizedBox(),
          )
        : const SizedBox();
  }
}

class ActionIcon extends StatelessWidget {
  const ActionIcon({
    super.key,
    required this.provider,
  });

  final StockProvider provider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ConstEdgeInsets.paddingSymetric(horizontalPad: 12.0),
      child: popupMenu(
          widget: const CustomIcon(
              icon: CupertinoIcons.ellipsis_vertical, size: 18),
          items: [
            PopupMenuItem(
              child: const Text("Edit"),
              onTap: () => customDialog(context,
                  widget: FormView(
                    apiUrl: "/updateMenu",
                    dialogContext: context,
                    route: "menu",
                    title: 'Menu Edit',
                    initialValue: provider.selectedTab?.toJson(),
                    edit: true,
                    provider: provider,
                    parameters: {"MENUID": provider.selectedTab?.menuId},
                  )),
            ),
            PopupMenuItem(
              child: const Text("Delete"),
              onTap: () => customAlertDialog(
                  context: context,
                  title: "Menu Delete",
                  onPressed: () => provider.deleteMenu(context),
                  text: "Do you want to delete menu"),
            )
          ]),
    );
  }
}
