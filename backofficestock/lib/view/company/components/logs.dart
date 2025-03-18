import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/view/company/company_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../product/constants/api_constants.dart';

class Logs extends StatelessWidget {
  const Logs({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CompanyProvider>();
    return CustomExpanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Logs",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      CustomExpanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
              decoration: const BoxDecoration(color: AppColors.lightGrey),
              showBottomBorder: true,
              dividerThickness: 0.3,
              columns: <DataColumn>[
                ...provider.logKeys.reversed
                    .map((e) => DataColumn(label: Text(e.toString())))
              ],
              rows: <DataRow>[
                ...provider.logs.map((e) => DataRow(
                        color: const WidgetStatePropertyAll(Colors.white),
                        cells: [
                          DataCell(Text(e.createdAt)),
                          DataCell(Text(e.statusMessage ?? "")),
                          DataCell(Text(e.statusCode)),
                          DataCell(Text(e.body.toString())),
                          DataCell(Text(e.originalUrl)),
                          DataCell(Text(e.company.toString())),
                          DataCell(Text(e.id.toString())),
                        ]))
              ]),
        ),
      )
    ]));
  }
}
