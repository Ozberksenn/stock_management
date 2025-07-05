import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/view/reports/reports.provider.dart';
import 'package:backofficestock/view/reports/widgets/linear_graph.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../product/widgets/custom_page.dart';
import '../home/home_proivder.dart';
import '../home/widgets/content_header.dart';
import 'widgets/excell_card_widget.dart';
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
              widget: ListView(
                children: [
                  ContentHeader(
                    title: homeProvider.menu.title ?? "",
                  ),
                  const CustomSizedBox.paddingHeight(heightValue: 24.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Fast Analysis",
                          style: Theme.of(context).textTheme.titleLarge),
                      const CustomSizedBox.paddingHeight(heightValue: 4.0),
                      Text(
                        "You can view the reports you want from here.",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const CustomSizedBox.paddingHeight(heightValue: 12.0),
                      reportsCardContainer(),
                      const CustomSizedBox.paddingHeight(heightValue: 18.0),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sales Management Chart Analysis",
                                  style:
                                      Theme.of(context).textTheme.titleMedium!),
                              const CustomSizedBox.paddingHeight(
                                  heightValue: 24.0),
                              LinearGraph(),
                            ],
                          )
                          // PieChartGraph(),
                        ],
                      ),
                      const CustomSizedBox.paddingHeight(heightValue: 24.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Other Reports",
                              style: Theme.of(context).textTheme.titleLarge),
                          const CustomSizedBox.paddingHeight(heightValue: 4.0),
                          Text(
                            "You can view the reports you want from here.",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const CustomSizedBox.paddingHeight(heightValue: 12.0),
                          const ExcellCardWidget(),
                          const CustomSizedBox.paddingHeight(heightValue: 12.0),
                          const ExcellCardWidget(),
                          const CustomSizedBox.paddingHeight(heightValue: 12.0),
                          const ExcellCardWidget()
                        ],
                      )

                      // stockta olup qr olmayan ürünler.
                      // LinearGraph(),
                      // PieChartGraph(),
                    ],
                  )
                ],
              ));
        });
  }

  Widget reportsCardContainer() {
    return const Row(
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
        ]);
  }
}
