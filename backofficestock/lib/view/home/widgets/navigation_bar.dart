import 'package:backofficestock/core/decoration/decoration.dart';
import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:backofficestock/core/widget/radius.dart';
import 'package:backofficestock/data/navigation_data.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/model/navigation_model.dart';
import 'package:backofficestock/product/storage/app_storage.dart';
import 'package:backofficestock/product/widgets/custom_elevated_button.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:backofficestock/view/home/home_proivder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/widget/padding.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 20.0, bottom: 20.0, top: 20.0), // todo düzenle.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset(
              "logo/stock-light.png",
              width: context.dynamicWidth(0.075),
            ),
            const CustomSizedBox.paddingHeight(heightValue: 40),
            ListView.builder(
                shrinkWrap: true,
                itemCount: navigationData.length,
                itemBuilder: (context, index) {
                  return MenuCard(
                    item: navigationData[index],
                  );
                })
          ]),
          const NavigationProfileCard(),
        ],
      ),
    );
  }
}

class NavigationProfileCard extends StatelessWidget {
  const NavigationProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const ConstEdgeInsets.paddingSymetric(verticalPad: 12),
      decoration: BoxDecoration(
          color: AppColors.dark, borderRadius: CustomRadius.radius16),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: CustomDecoration.circularImageDecoration(
                imageUrl: AppString.customProfileUrl),
          ),
          const CustomSizedBox.paddingHeight(heightValue: 2),
          Text('Özberk Şen', style: AppFonts.whiteBodyMedium),
          Text('Company: 1', style: AppFonts.formLabelStyle),
          const CustomSizedBox.paddingHeight(heightValue: 8),
          CustomElevatedButton(
              text: "Log out",
              onPressed: () async {
                await StorageService().clearStorage();
                if (StorageService().token == "") {
                  context.go("/");
                }
              })
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final NavigationModel item;
  const MenuCard({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    final HomeProivder homeProvider = context.watch();
    return ListTile(
        onTap: () {
          homeProvider.changeMenu(item);
        },
        contentPadding: const ConstEdgeInsets.padding0(),
        title: Text(item.title ?? "",
            style: item.id == homeProvider.menu.id
                ? AppFonts.whiteBodyMedium
                : AppFonts.greyBodyMedium),
        leading: CustomIcon(
          icon: item.icon,
          color: item.id == homeProvider.menu.id
              ? AppColors.white
              : AppColors.grey,
        ));
  }
}
