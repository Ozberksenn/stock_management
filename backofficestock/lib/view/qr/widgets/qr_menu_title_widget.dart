import 'package:backofficestock/core/widget/padding.dart';
import 'package:flutter/material.dart';
import '../../../core/widget/radius.dart';
import '../../../product/constants/api_constants.dart';
import '../../../product/model/menu_model.dart';

class QrMenuTitle extends StatelessWidget {
  final MenuModel? selectedTab;
  const QrMenuTitle({super.key, this.selectedTab});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: CustomRadius.radius12,
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppString.custumProductUrl))),
              width: 100,
              height: 100),
          const CustomSizedBox.paddingWidth(widthValue: 12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(selectedTab?.menuName ?? "",
                  style: Theme.of(context).textTheme.titleMedium),
              Text(selectedTab?.menuDescription ?? "",
                  style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        ],
      ),
    );
  }
}
