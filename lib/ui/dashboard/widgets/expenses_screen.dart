import 'package:flutter/material.dart';
import 'package:personal_finance/ui/core/themes/default_metrics.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(DefaultMetrics.screenPadding),
        child: Column(
          children: <Widget>[
            Text("Expenses Screen in construction")
          ],
        ),
      ),
    );
  }
}