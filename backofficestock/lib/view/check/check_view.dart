import 'package:backofficestock/core/widget/padding.dart';
// import 'package:backofficestock/view/check/widgets/check_empty_table_widget.dart';
import 'package:backofficestock/view/check/widgets/check_header.dart';
import 'package:backofficestock/view/check/widgets/content_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home/home_proivder.dart';
import '../home/widgets/content_header.dart';

class CheckView extends StatelessWidget {
  const CheckView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProivder homeProvider = context.read<HomeProivder>();
    return Column(children: [
      ContentHeader(
        title: homeProvider.menu.title ?? "",
      ),
      const CustomSizedBox.paddingHeight(heightValue: 18.0),
      const CheckHeader(),
      const CustomSizedBox.paddingHeight(heightValue: 18.0),
      const Content()
    ]);
  }
}
