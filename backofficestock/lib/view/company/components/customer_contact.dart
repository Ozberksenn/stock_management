import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/view/company/company_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerContact extends StatelessWidget {
  const CustomerContact({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CompanyProvider>();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Customer Contact",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      const CustomSizedBox.paddingHeight(heightValue: 12.0),
      CustomExpanded(
        child: SingleChildScrollView(
          child: DataTable(
              decoration: const BoxDecoration(color: AppColors.white),
              dividerThickness: 0.2,
              columns: <DataColumn>[
                ...provider.customerContactKeys
                    .map((e) => DataColumn(label: Text(e.toString())))
              ],
              rows: <DataRow>[
                ...provider.customerContacts.map((e) => DataRow(cells: [
                      DataCell(Text(e.id.toString())),
                      DataCell(Text(e.companyName ?? "")),
                      DataCell(Text(e.phone ?? "")),
                      DataCell(Text(e.contactMail ?? "")),
                      DataCell(Text(e.description ?? "")),
                    ]))
              ]),
        ),
      )
    ]);
  }
}
