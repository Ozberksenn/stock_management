import 'package:flutter/material.dart';

@immutable
final class AppColors {
  const AppColors._(); // AppColors sınıfının bir örneğinin oluşturulmasını engellemek için kullanılmıştır.

  static const Color black = Color.fromRGBO(39, 42, 45, 1);
  static const Color dark = Color.fromRGBO(50, 52, 54, 1);
  static const Color white = Colors.white;
}

@immutable
final class AppFonts {
  const AppFonts._();

  static const TextStyle logoText = TextStyle(
      fontSize: 22, color: AppColors.white, fontWeight: FontWeight.w200);
}

@immutable
final class AppString {
  const AppString._();
  static const customProfileUrl =
      "https://cdn.pixabay.com/photo/2021/06/15/16/11/man-6339003_1280.jpg";
  static const logoUrl = '';
}
