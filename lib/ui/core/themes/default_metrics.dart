import 'package:flutter/cupertino.dart';

sealed class DefaultMetrics {
  static const double screenPadding = 20.0;
  static const double borderRadius = 8.0;
  static const double fieldBorderRadius = 4.0;

  static const BorderRadius roundedBorderRadius = BorderRadius.all(
    Radius.circular(
      DefaultMetrics.borderRadius,
    ),
  );
}
