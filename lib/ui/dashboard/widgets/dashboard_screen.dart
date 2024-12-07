import 'package:flutter/material.dart';
import 'package:personal_finance/ui/core/ui/default_metrics.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(DefaultMetrics.screenPadding),
        child: Column(
          children: <Widget>[
            Text("Dashboard Screen in construction")
          ],
        ),
      ),
    );
  }
}
