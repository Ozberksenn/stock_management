import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? color;
  final TextStyle? style;
  const CustomElevatedButton(
      {super.key, required this.text, this.onPressed, this.color, this.style});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(color ?? AppColors.lightGrey)),
        onPressed: onPressed,
        child: Text(
          text,
          style: style ?? Theme.of(context).textTheme.titleSmall,
        ));
  }
}
