import 'package:backofficestock/view/check/check_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../product/widgets/custom_icon.dart';

class CheckOrder extends StatelessWidget {
  const CheckOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CheckProvider checkProvider = context.read<CheckProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Order Detail", style: Theme.of(context).textTheme.titleMedium),
          const CustomIcon(icon: CupertinoIcons.add_circled)
        ]),
        const Divider(),
        ListView.builder(
            itemCount: checkProvider.selectedTable?.products?.length ?? 0,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Text("Product $index");
            })
      ],
    );
  }
}
