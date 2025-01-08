import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/core/widget/radius.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:flutter/material.dart';

ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      contentPadding: const ConstEdgeInsets.padding8(),
      enabledBorder: OutlineInputBorder(
          borderRadius: CustomRadius.radius12,
          borderSide: const BorderSide(width: 0.5, color: AppColors.dark)),
      focusedBorder: OutlineInputBorder(
          borderRadius: CustomRadius.radius12,
          borderSide: const BorderSide(width: 1, color: AppColors.dark)),
      border: OutlineInputBorder(
          borderRadius: CustomRadius.radius12,
          borderSide: const BorderSide(width: 0.5, color: AppColors.dark)),
    ));
