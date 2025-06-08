import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/view/check/widgets/check_header.dart';
import 'package:backofficestock/view/check/widgets/content_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../product/utils/undefined/no_item_widget.dart';
import '../home/home_proivder.dart';
import '../home/widgets/content_header.dart';
import 'check_provider.dart';

class CheckView extends StatelessWidget {
  const CheckView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CheckProvider(),
        builder: (context, child) {
          HomeProivder homeProvider = context.read<HomeProivder>();
          CheckProvider checkProvider = context.watch<CheckProvider>();
          return Column(children: [
            ContentHeader(
              title: homeProvider.menu.title ?? "",
            ),
            const CustomSizedBox.paddingHeight(heightValue: 18.0),
            const CheckHeader(),
            const CustomSizedBox.paddingHeight(heightValue: 18.0),
            const Content()
          ]);
        });
  }
}
