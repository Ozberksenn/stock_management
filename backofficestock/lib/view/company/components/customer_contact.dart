import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/utils/modal/custom_alert_dialog.dart';
import 'package:backofficestock/product/utils/undefined/no_item_widget.dart';
import 'package:backofficestock/product/widgets/custom_divider.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:backofficestock/view/company/company_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/company_header.dart';

class CustomerContact extends StatelessWidget {
  const CustomerContact({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CompanyProvider>();

    DataTable dataTable(CompanyProvider provider) {
      return DataTable(
          decoration: const BoxDecoration(color: AppColors.white),
          dividerThickness: 0.2,
          columns: <DataColumn>[
            ...provider.customerContactKeys.map((e) => DataColumn(
                    label: Text(
                  e.toString(),
                  style: AppFonts.boldSmall,
                )))
          ],
          rows: <DataRow>[
            ...provider.customerContacts.map((e) => DataRow(
                    selected:
                        provider.deletedCustomerContactList.contains(e.id),
                    onSelectChanged: (value) {
                      provider.selectedCustomer(e.id);
                    },
                    cells: [
                      DataCell(Text(e.id.toString())),
                      DataCell(Text(e.companyName ?? "")),
                      DataCell(Text(e.phone ?? "")),
                      DataCell(Text(e.contactMail ?? "")),
                      DataCell(Text(e.description ?? "")),
                    ]))
          ]);
    }

    return CustomExpanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CompanyHeader(
            provider: provider,
            title: "Customer Contact",
            child: CustomIcon(
                icon: CupertinoIcons.delete,
                color: AppColors.error,
                size: 20,
                onTap: () => customAlertDialog(
                    context: context,
                    title: "Are u sure ?",
                    text: "The selected items will be deleted",
                    onPressed: () => provider.deletedCustomers(context)))),
        const CustomSizedBox.paddingHeight(heightValue: 12.0),
        const CustomDivider(),
        const CustomSizedBox.paddingHeight(heightValue: 12.0),
        provider.isCustomerContact
            ? CustomExpanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    child: dataTable(provider),
                  ),
                ),
              )
            : const NoItemWidget()
      ]),
    );
  }
}
