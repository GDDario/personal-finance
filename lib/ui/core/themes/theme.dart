import 'package:flutter/material.dart';
import 'package:personal_finance/ui/core/themes/colors.dart';
import 'package:personal_finance/ui/core/themes/default_metrics.dart';

sealed class AppTheme {
  static const _textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
  );

  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(DefaultMetrics.fieldBorderRadius),
    ),
  );

  static const DatePickerThemeData _datePickerTheme = DatePickerThemeData(
    shape: RoundedRectangleBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(DefaultMetrics.borderRadius)),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    inputDecorationTheme: _inputDecorationTheme,
    datePickerTheme: _datePickerTheme,
    textTheme: _textTheme,
    fontFamily: 'Inter',
  );
}
