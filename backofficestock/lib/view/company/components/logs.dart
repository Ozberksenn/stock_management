import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/utils/undefined/no_item_widget.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:backofficestock/view/company/company_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../product/constants/api_constants.dart';
import '../../../product/widgets/custom_divider.dart';
import '../widgets/company_header.dart';

class Logs extends StatelessWidget {
  const Logs({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CompanyProvider>();

    Widget dataTable(CompanyProvider provider) {
      return CustomExpanded(
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
      );
    }

    return CustomExpanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CompanyHeader(
          provider: provider,
          title: "Logs",
          child: CustomIcon(
              icon: CupertinoIcons.refresh, onTap: () => provider.fetchLogs())),
      const CustomSizedBox.paddingHeight(heightValue: 12.0),
      const CustomDivider(),
      const CustomSizedBox.paddingHeight(heightValue: 12.0),
      provider.isLogs ? dataTable(provider) : const NoItemWidget()
    ]));
  }
}
