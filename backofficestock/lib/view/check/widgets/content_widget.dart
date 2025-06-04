import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/view/check/widgets/check_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../check_provider.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    CheckProvider checkProvider = context.watch<CheckProvider>();

    return CustomExpanded(
        child: GridView.builder(
            itemCount: checkProvider.tables.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            itemBuilder: (context, index) {
              return CheckCard(table: checkProvider.tables[index]);
            }));
  }
}
