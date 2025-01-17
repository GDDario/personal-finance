import 'package:flutter/material.dart';

sealed class AppColors {
  static const Color blue1 = Color(0xFF1962ff);
  static const Color white1 = Color(0xFFFFF7FA);
  static const Color purple1 = Color(0xFF5940d8);
  static const Color red1 = Color(0xFFdb1a1a);
  static const Color grey1 = Color(0xffbababa);
  static const Color grey2 = Color(0xff737373);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.blue1,
    onPrimary: AppColors.white1,
    secondary: AppColors.purple1,
    onSecondary: AppColors.white1,
    error: Colors.white,
    onError: AppColors.red1,
    surface: AppColors.white1,
    onSurface: Colors.black,
  );
}
