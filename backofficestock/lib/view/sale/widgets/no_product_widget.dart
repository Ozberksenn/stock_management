import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class NoProductWidget extends StatelessWidget {
  const NoProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(0.25),
      height: context.dynamicHeight(0.25),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/no-product.png"))),
    );
  }
}
