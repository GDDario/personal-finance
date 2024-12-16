import 'package:flutter/material.dart';
import 'package:personal_finance/ui/core/themes/theme.dart';
import 'routing/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Personal Finance',
      theme: AppTheme.lightTheme,
      routerConfig: router(),
    );
  }

}
