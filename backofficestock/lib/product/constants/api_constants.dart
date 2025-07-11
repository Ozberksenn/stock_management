import 'package:backofficestock/product/theme/theme.dart';
import 'package:flutter/material.dart';

@immutable
final class AppColors {
  const AppColors._(); // AppColors sınıfının bir örneğinin oluşturulmasını engellemek için kullanılmıştır.

  static const Color black = Color.fromRGBO(39, 42, 45, 1);
  static const Color dark = Color.fromRGBO(50, 52, 54, 1);
  static const Color white = Colors.white;
  static const Color grey = Color.fromARGB(255, 203, 196, 196);
  static const Color lightGrey = Color.fromARGB(255, 243, 240, 240);
  static const Color softGrey = Color.fromARGB(255, 248, 246, 246);
  static const Color primaryColor = Color.fromRGBO(32, 80, 153, 1);
  static const Color blue = Color.fromRGBO(32, 80, 153, 1);
  static const Color error = Colors.red;
  static const Color red = Color.fromARGB(255, 195, 62, 53);
  static const Color yellow = Color.fromARGB(255, 239, 235, 7);
  static const Color green = Colors.green;
  static const Color activeCardColor = Color.fromARGB(255, 101, 138, 103);
  static const Color reservedCardColor = Color.fromARGB(255, 236, 234, 135);
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
  static final TextStyle formLabelStyle = AppTheme
      .lightTheme.textTheme.labelSmall!
      .copyWith(fontSize: 12, color: const Color.fromARGB(255, 160, 157, 157));
  static final TextStyle boldSmall = AppTheme.lightTheme.textTheme.labelSmall!
      .copyWith(
          fontSize: 14, color: AppColors.black, fontWeight: FontWeight.w700);
  static final TextStyle greenTitleMedium = AppTheme
      .lightTheme.textTheme.titleMedium!
      .copyWith(fontSize: 18, color: AppColors.green);
  static const TextStyle inputStyle =
      TextStyle(fontSize: 14, color: AppColors.dark);
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
