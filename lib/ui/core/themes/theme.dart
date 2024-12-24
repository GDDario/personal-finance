import 'package:flutter/material.dart';
import 'package:personal_finance/ui/core/themes/colors.dart';
import 'package:personal_finance/ui/core/themes/default_metrics.dart';

sealed class AppTheme {
  static const _textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      color: AppColors.grey2
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

  static final ElevatedButtonThemeData _elevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(AppColors.blue1),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
        overlayColor: WidgetStatePropertyAll(Colors.white.withAlpha(30)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DefaultMetrics.borderRadius),
        )),
        padding: const WidgetStatePropertyAll(EdgeInsets.all(20)),
        elevation: const WidgetStatePropertyAll(3)),
  );

  static final ListTileThemeData _listTileTheme = ListTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        DefaultMetrics.borderRadius,
      ),
    ),
  );

  static final DialogThemeData _dialogTheme = DialogThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(DefaultMetrics.borderRadius),
    )
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    inputDecorationTheme: _inputDecorationTheme,
    datePickerTheme: _datePickerTheme,
    dataTableTheme: _dataTableTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    listTileTheme: _listTileTheme,
    textTheme: _textTheme,
    dialogTheme: _dialogTheme,
    fontFamily: 'Inter',
  );
}
