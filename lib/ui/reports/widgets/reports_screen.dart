import 'package:flutter/material.dart';
import 'package:personal_finance/ui/core/themes/default_metrics.dart';
import 'package:personal_finance/ui/core/ui/date_picker_text_field.dart';
import 'package:personal_finance/ui/reports/models/export_option.dart';
import 'package:personal_finance/ui/reports/view_models/reports_viewmodel.dart';
import 'package:personal_finance/ui/reports/widgets/reports_table.dart';
import 'package:provider/provider.dart';

class ReportsScreen extends StatefulWidget {
  final ReportsViewModel viewModel;

  const ReportsScreen({super.key, required this.viewModel});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  void initState() {
    super.initState();

    widget.viewModel.loadExpenses();
  }

  @override
  Widget build(BuildContext context) {
    final ReportsViewModel viewModel = context.watch<ReportsViewModel>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DefaultMetrics.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Reports",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 15,
                        children: <Widget>[
                          SizedBox(
                            width: 220,
                            child: DatePickerTextField(
                              controller: viewModel.startDateController,
                              labelText: 'Start date',
                            ),
                          ),
                          SizedBox(
                            width: 220,
                            child: DatePickerTextField(
                              controller: viewModel.endDateController,
                              labelText: 'End date',
                            ),
                          ),
                          SizedBox(
                            width: 110,
                            child: ElevatedButton(
                              onPressed: () => widget.viewModel.filterTable(),
                              child: const Row(
                                children: [
                                  Text('Filter'),
                                  Spacer(),
                                  Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 155,
                        child: PopupMenuButton<String>(
                          tooltip: "Show export menu",
                          position: PopupMenuPosition.under,
                          onSelected: (String value) {
                            print("Exporting to: $value");
                          },
                          itemBuilder: (BuildContext context) =>
                              widget.viewModel.exportOptions
                                  .map(
                                    (ExportOption exportOption) =>
                                        PopupMenuItem<String>(
                                      value: exportOption.value,
                                      child: Text(exportOption.label),
                                    ),
                                  )
                                  .toList(),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(
                                DefaultMetrics.borderRadius,
                              ),
                            ),
                            child: const Row(
                              children: [
                                Text('Export data',
                                    style: TextStyle(color: Colors.white)),
                                Spacer(),
                                Icon(
                                  Icons.newspaper,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  ReportsTable(viewModel: viewModel),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
