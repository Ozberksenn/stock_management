import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:backofficestock/view/company/company_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerContact extends StatelessWidget {
  const CustomerContact({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CompanyProvider>();
    return CustomExpanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Customer Contact",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            CustomIcon(
              icon: CupertinoIcons.delete,
              color: AppColors.error,
              size: 20,
              onTap: () => provider.deletedCustomers(),
            )
          ],
        ),
        const CustomSizedBox.paddingHeight(heightValue: 12.0),
        CustomExpanded(
          child: SingleChildScrollView(
            child: SizedBox(
              child: DataTable(
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
                            selected: provider.deletedCustomerContactList
                                .contains(e.id),
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
                  ]),
            ),
          ),
        )
      ]),
    );
  }
}
