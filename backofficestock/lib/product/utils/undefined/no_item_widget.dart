// import 'package:backofficestock/core/extension/context_extension.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:lottie/lottie.dart';

class NoItemWidget extends StatelessWidget {
  final String? message;
  const NoItemWidget({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.emoji_food_beverage_rounded,
          size: 100,
        ),
        Text(message ?? "")
      ],
    )
        //  Lottie.asset('json/nothing.json',
        //     width: context.dynamicWidth(0.2), height: context.dynamicHeight(0.2)),
        );
  }
}
