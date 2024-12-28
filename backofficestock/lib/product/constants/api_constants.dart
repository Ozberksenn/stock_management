import 'package:flutter/material.dart';

@immutable
final class AppColors {
  const AppColors._(); // AppColors sınıfının bir örneğinin oluşturulmasını engellemek için kullanılmıştır.

  static const Color black = Colors.black;
}

@immutable
final class AppFonts {
  const AppFonts._();

  static const TextStyle logoText = TextStyle(
      fontSize: 22, color: AppColors.black, fontWeight: FontWeight.w200);
}

@immutable
final class AppString {
  const AppString._();
  static const customImage = "";
  static const logoUrl = 'assets/logo/tammam.png';
}
