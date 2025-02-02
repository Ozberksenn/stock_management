import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:flutter/material.dart';

successSnackbar({required BuildContext context, String? message}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
    message ?? "",
    style: AppFonts.greyBodyMedium,
  )));
}

errorSnackbar({required BuildContext context, String? message}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.error,
      content: Text(
        message ?? "",
        style: AppFonts.whiteBodyMedium,
      )));
}
