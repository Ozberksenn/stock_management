import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../product/widgets/custom_page.dart';
import '../home/home_proivder.dart';
import '../home/widgets/content_header.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProivder homeProvider = context.read<HomeProivder>();
    return CustomPage(
        isLoading: true,
        widget: Column(
          children: [
            ContentHeader(
              title: homeProvider.menu.title ?? "",
            ),
          ],
        ));
  }
}
