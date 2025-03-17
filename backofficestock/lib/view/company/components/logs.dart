import 'package:backofficestock/core/widget/padding.dart';
import 'package:flutter/material.dart';

class Logs extends StatelessWidget {
  const Logs({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomExpanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Logs",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    ]));
  }
}
