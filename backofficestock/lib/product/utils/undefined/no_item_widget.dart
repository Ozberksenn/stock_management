import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoItemWidget extends StatelessWidget {
  const NoItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.asset('json/nothing.json',
          width: context.dynamicWidth(0.2), height: context.dynamicHeight(0.2)),
    );
  }
}
