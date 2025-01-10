import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import '../constants/api_constants.dart';

Future<dynamic> customDialog(BuildContext context,
    {double? width, double? height}) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            width: width ?? context.dynamicWidth(0.8),
            height: height ?? context.dynamicWidth(0.5),
            child: Container(),
          ),
        );
      });
}
