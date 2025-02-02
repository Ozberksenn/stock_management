import 'package:backofficestock/product/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<dynamic> customAlertDialog(
    {required BuildContext context,
    String? title,
    String? text,
    void Function()? onPressed}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? ""),
          content: Text(text ?? ""),
          actions: [
            CustomElevatedButton(
              text: "Cancel",
              onPressed: () => context.pop(),
            ),
            CustomElevatedButton(text: "Ok", onPressed: onPressed)
          ],
        );
      });
}
