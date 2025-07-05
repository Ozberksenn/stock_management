import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/view/reports/reports.provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../product/widgets/custom_page.dart';
import '../home/home_proivder.dart';
import '../home/widgets/content_header.dart';
import 'widgets/report_card_widget.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProivder homeProvider = context.read<HomeProivder>();
    return ChangeNotifierProvider(
        create: (_) => ReportsProvider(),
        builder: (context, child) {
          ReportsProvider reportsProvider = context.watch<ReportsProvider>();
          return CustomPage(
              isLoading: true,
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentHeader(
                    title: homeProvider.menu.title ?? "",
                  ),
                  const CustomSizedBox.paddingHeight(heightValue: 24.0),
                  Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomExpanded(
                                child: ReportCard(
                              icon: Iconsax.activity,
                              title: "18",
                              subtitle: "Critical Stock Quantity",
                            )),
                            CustomSizedBox.paddingWidth(widthValue: 6.0),
                            CustomExpanded(
                                child: ReportCard(
                              icon: Iconsax.activity,
                              title: "18",
                              subtitle: "Critical Stock Quantity",
                            )),
                            CustomSizedBox.paddingWidth(widthValue: 6.0),
                            CustomExpanded(
                                child: ReportCard(
                              icon: Iconsax.activity,
                              title: "18",
                              subtitle: "Critical Stock Quantity",
                            )),
                            CustomSizedBox.paddingWidth(widthValue: 6.0),
                            CustomExpanded(
                                child: ReportCard(
                              icon: Iconsax.activity,
                              title: "18",
                              subtitle: "Critical Stock Quantity",
                            )),
                          ])

                      // stockta olup qr olmayan ürünler.
                      // LinearGraph(),
                      // PieChartGraph(),
                    ],
                  )
                ],
              ));
        });
  }
}
