import 'package:backofficestock/core/widget/padding.dart';
import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  final String? title;
  final List<Widget>? widget;
  const FormCard({super.key, this.title, this.widget});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: const ConstEdgeInsets.padding0(),
      dense: true,
      tilePadding: const ConstEdgeInsets.padding0(),
      title: Text(
        title ?? "",
        style: Theme.of(context).textTheme.titleMedium,
      ),
      initiallyExpanded: true,
      shape: Border.all(width: 0, color: Colors.transparent),
      children: widget ?? [],
    );
  }
}
