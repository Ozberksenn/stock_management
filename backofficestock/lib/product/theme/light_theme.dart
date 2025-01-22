import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/core/widget/radius.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:flutter/material.dart';

ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      hintStyle: const TextStyle(fontSize: 12, color: AppColors.dark),
      contentPadding: const ConstEdgeInsets.padding8(),
      enabledBorder: OutlineInputBorder(
          borderRadius: CustomRadius.radius6,
          borderSide: const BorderSide(width: 0.5, color: AppColors.grey)),
      focusedBorder: OutlineInputBorder(
          borderRadius: CustomRadius.radius6,
          borderSide: const BorderSide(width: 1, color: AppColors.grey)),
      border: OutlineInputBorder(
          borderRadius: CustomRadius.radius6,
          borderSide: const BorderSide(width: 0.5, color: AppColors.grey)),
    ));
