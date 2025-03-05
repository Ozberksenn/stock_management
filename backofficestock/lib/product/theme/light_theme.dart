import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/core/widget/radius.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:flutter/material.dart';

ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: AppColors.blue,
    fontFamily: 'Montserrat',
    popupMenuTheme:
        const PopupMenuThemeData(color: AppColors.white, elevation: 2),
    switchTheme: const SwitchThemeData(
        trackColor: WidgetStatePropertyAll(AppColors.blue)),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      labelStyle: const TextStyle(fontSize: 12, color: AppColors.dark),
      hintStyle: const TextStyle(fontSize: 12, color: AppColors.dark),
      contentPadding: const ConstEdgeInsets.padding8(),
      enabledBorder: OutlineInputBorder(
          borderRadius: CustomRadius.radius12,
          borderSide: const BorderSide(width: 0.5, color: AppColors.grey)),
      focusedBorder: OutlineInputBorder(
          borderRadius: CustomRadius.radius12,
          borderSide: const BorderSide(width: 1, color: AppColors.grey)),
      border: OutlineInputBorder(
          borderRadius: CustomRadius.radius12,
          borderSide: const BorderSide(width: 0.5, color: AppColors.grey)),
    ));
