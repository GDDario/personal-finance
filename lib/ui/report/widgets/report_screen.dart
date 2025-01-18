import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_finance/ui/core/themes/default_metrics.dart';
import 'package:personal_finance/ui/report/view_models/report_viewmodel.dart';

class ReportScreen extends StatefulWidget {
  final ReportViewModel viewModel;

  const ReportScreen({super.key, required this.viewModel});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DefaultMetrics.screenPadding),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 4,
                children: [
                  IconButton(
                    onPressed: () => context.go("/reports"),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Text(
                    "Go back to the reports page",
                  ),
                ],
              ),
              Text(
                "Expense #${widget.viewModel.expenseId}",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Column()
            ],
          ),
        ),
      ),
    );
  }
}
