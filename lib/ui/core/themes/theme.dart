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

  static final DataTableThemeData _dataTableTheme = DataTableThemeData(
      decoration: BoxDecoration(
        border: Border.all(),
    borderRadius: BorderRadius.circular(DefaultMetrics.borderRadius),
  ));

  static final ElevatedButtonThemeData _elevatedButtonTheme = ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.blue1),
        foregroundColor: WidgetStatePropertyAll(Colors.white), // Define a cor branca para o texto
        overlayColor: WidgetStatePropertyAll(Colors.white.withAlpha(30)), // Define o ripple effect
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DefaultMetrics.borderRadius),
        )),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 20, horizontal: 20)),
        elevation: WidgetStatePropertyAll(3)
      ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    inputDecorationTheme: _inputDecorationTheme,
    datePickerTheme: _datePickerTheme,
    dataTableTheme: _dataTableTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    textTheme: _textTheme,
    fontFamily: 'Inter',
  );
}
