import 'package:backofficestock/core/decoration/decoration.dart';
import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:backofficestock/core/widget/radius.dart';
import 'package:backofficestock/data/navigation_data.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/model/navigation_model.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import '../../../core/widget/padding.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomExpanded(
        child: Container(
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
    ));
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
      padding: const ConstEdgeInsets.paddingSymetric(verticalPad: 24),
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
          const CustomSizedBox.paddingHeight(heightValue: 8),
          Text('Özberk Şen', style: Theme.of(context).textTheme.labelLarge),
          const CustomSizedBox.paddingHeight(heightValue: 4),
          Text(
            'Company: 1',
            style: Theme.of(context).textTheme.labelSmall,
          )
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
    return ListTile(
        contentPadding: const ConstEdgeInsets.padding0(),
        title: Text(item.title ?? ""),
        leading: CustomIcon(icon: item.icon));
  }
}
