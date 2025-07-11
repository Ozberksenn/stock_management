import 'package:backofficestock/product/widgets/custom_page.dart';
import 'package:backofficestock/view/company/company_provider.dart';
import 'package:backofficestock/view/company/widgets/content_widgets.dart';
import 'package:backofficestock/view/home/home_proivder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home/widgets/content_header.dart';

class CompanyView extends StatelessWidget {
  const CompanyView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProivder homeProvider = context.read<HomeProivder>();
    CompanyProvider companyProvider = context.watch<CompanyProvider>();
    return CustomPage(
        isLoading: companyProvider.isReady,
        widget: Column(
          children: [
            ContentHeader(
              title: homeProvider.menu.title ?? "",
            ),
            content(context, companyProvider)
          ],
        ));
  }
}
