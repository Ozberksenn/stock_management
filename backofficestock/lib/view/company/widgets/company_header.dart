import 'package:flutter/material.dart';

import '../company_provider.dart';

class CompanyHeader extends StatelessWidget {
  final String title;
  final Widget? child;
  const CompanyHeader(
      {super.key, required this.provider, required this.title, this.child});

  final CompanyProvider provider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        child ?? const SizedBox()
      ],
    );
  }
}
