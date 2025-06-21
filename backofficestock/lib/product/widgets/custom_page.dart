import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  final bool? isLoading;
  final Widget widget;
  const CustomPage({super.key, this.isLoading, required this.widget});

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? Container(
            child: widget,
          )
        : const Align(
            child: CircularProgressIndicator(color: AppColors.primaryColor));
  }
}
