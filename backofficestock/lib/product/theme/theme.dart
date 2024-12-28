import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = lightTheme;
  static ThemeData darkTheme = lightTheme;
}

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);
