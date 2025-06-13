import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/view/check/widgets/check_order_provider.dart';
import 'package:flutter/material.dart';

class SelectOrderDialog extends StatelessWidget {
  final CheckOrderProvider? provider;
  const SelectOrderDialog({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const ConstEdgeInsets.padding12(),
      child: Column(
        children: [
          const Text("Select Order"),
          CustomExpanded(
            child: ListView.builder(
                itemCount: provider?.products.length ?? 0,
                itemBuilder: (context, index) {
                  return Text(provider?.products[index].productName ?? "");
                }),
          )
        ],
      ),
    );
  }
}
