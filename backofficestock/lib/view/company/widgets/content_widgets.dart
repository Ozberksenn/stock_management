import 'package:backofficestock/core/widget/radius.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/view/company/company_provider.dart';
import 'package:backofficestock/view/company/components/create_company.dart';
import 'package:backofficestock/view/company/data/company_menu_data.dart';
import 'package:flutter/material.dart';
import '../../../core/widget/padding.dart';
import '../components/company.dart';

content(BuildContext context, CompanyProvider provider) {
  menuContent(BuildContext context, CompanyProvider provider) {
    switch (provider.selectedMenu) {
      case 0:
        return Company(provider: provider);
      case 3:
        return CreateCompany(provider: provider);
      default:
        return const SizedBox();
    }
  }

  return CustomExpanded(
      child: Padding(
    padding: const ConstEdgeInsets.paddingSymetric(verticalPad: 12.0),
    child: Row(children: [
      CompanyMenu(
        provider: provider,
      ),
      const CustomSizedBox.paddingWidth(widthValue: 12.0),
      menuContent(context, provider)
    ]),
  ));
}

class CompanyMenu extends StatelessWidget {
  final CompanyProvider provider;
  const CompanyMenu({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 180,
        decoration: BoxDecoration(
            color: AppColors.lightGrey, borderRadius: CustomRadius.radius6),
        padding: const ConstEdgeInsets.padding12(),
        child: ListView.builder(
            itemCount: companyMenuData.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => provider.changeMenu(companyMenuData[index].id),
                title: Text(
                  companyMenuData[index].title ?? "",
                  style: companyMenuData[index].id == provider.selectedMenu
                      ? AppFonts.boldSmall
                      : Theme.of(context).textTheme.bodyMedium,
                ),
              );
            }));
  }
}
