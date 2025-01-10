import 'package:backofficestock/product/theme/theme.dart';
import 'package:flutter/material.dart';

@immutable
final class AppColors {
  const AppColors._(); // AppColors sınıfının bir örneğinin oluşturulmasını engellemek için kullanılmıştır.

  static const Color black = Color.fromRGBO(39, 42, 45, 1);
  static const Color dark = Color.fromRGBO(50, 52, 54, 1);
  static const Color white = Colors.white;
  static const Color grey = Color.fromARGB(255, 203, 196, 196);
  static const Color primaryColor = Color.fromRGBO(124, 33, 36, 1);
}

@immutable
final class AppFonts {
  const AppFonts._();

  static final TextStyle whiteHeadlineSmall = AppTheme
      .lightTheme.textTheme.headlineMedium!
      .copyWith(color: AppColors.white);
  static final TextStyle whiteTitleLarge = AppTheme
      .lightTheme.textTheme.titleLarge!
      .copyWith(color: AppColors.white);
  static final TextStyle whiteBodyMedium = AppTheme
      .lightTheme.textTheme.bodyMedium!
      .copyWith(color: AppColors.white);
  static final TextStyle greyBodyMedium = AppTheme
      .lightTheme.textTheme.bodyMedium!
      .copyWith(color: const Color.fromARGB(255, 160, 157, 157));
  static final TextStyle greylabelSmall = AppTheme
      .lightTheme.textTheme.labelSmall!
      .copyWith(color: const Color.fromARGB(255, 160, 157, 157));
}

@immutable
final class AppString {
  const AppString._();
  static const customProfileUrl =
      "https://cdn.pixabay.com/photo/2021/06/15/16/11/man-6339003_1280.jpg";
  static const custumProductUrl =
      "https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-madebymath-90946.jpg&fm=jpg";
  static const logoUrl = '';
}
