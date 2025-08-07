import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/view/check/widgets/check_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../check_provider.dart';
import 'check_basket.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    CheckProvider checkProvider = context.watch<CheckProvider>();
    return CustomExpanded(
      child: Row(children: [
        checkProvider.tables.isNotEmpty
            ? CustomExpanded(
                flex: 3,
                child: GridView.builder(
                    itemCount: checkProvider.tables.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1.2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return CheckCard(table: checkProvider.tables[index]);
                    }),
              )
            : const SizedBox(),
        const CustomSizedBox.paddingWidth(widthValue: 12.0),
        const CheckBasket()
      ]),
    );
  }
}
