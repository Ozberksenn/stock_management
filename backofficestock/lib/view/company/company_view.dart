import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/view/company/company_provider.dart';
import 'package:backofficestock/view/home/home_proivder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home/widgets/content_header.dart';
import 'widgets/company_form.dart';

class CompanyView extends StatelessWidget {
  const CompanyView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CompanyProvider(),
      builder: (context, child) {
        HomeProivder homeProvider = context.read<HomeProivder>();
        return Column(
          children: [
            ContentHeader(
              title: homeProvider.menu.title ?? "",
            ),
            CustomExpanded(child: SingleChildScrollView(child: CompanyForm()))
          ],
        );
      },
    );
  }
}
