import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:personal_finance/ui/core/themes/colors.dart';
import 'package:personal_finance/ui/reports/view_models/reports_viewmodel.dart';

class ReportsTable extends StatefulWidget {
  final ReportsViewModel viewModel;

  const ReportsTable({super.key, required this.viewModel});

  @override
  State<ReportsTable> createState() => _ReportsTableState();
}

class _ReportsTableState extends State<ReportsTable> {
  @override
  Widget build(BuildContext context) {
    final rows = widget.viewModel.tableItems;
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1600),
      child: SizedBox(
        height: 365,
        child: DataTable2(
          sortAscending: false,
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          smRatio: 0.75,
          lmRatio: 0.15,
          columns: const <DataColumn>[
            DataColumn(label: Text('Id')),
            DataColumn(label: Text("Establishment")),
            DataColumn(label: Text("Items")),
            DataColumn(label: Text("Total items")),
            DataColumn(label: Text("Adjustments")),
            DataColumn(label: Text("Total add.")),
            DataColumn(label: Text("Total disc.")),
            DataColumn(label: Text("Attachments")),
            DataColumn(label: Text("Total")),
            DataColumn2(label: Text("Date time"), fixedWidth: 300),
            DataColumn2(label: Text("Actions"), fixedWidth: 150),
          ],
          rows: rows
              .asMap()
              .map(
                (i, row) {
                  return MapEntry(
                    i,
                    DataRow(
                      cells: [
                        DataCell(Text(row.id.toString())),
                        DataCell(Text(row.establishment)),
                        DataCell(Text(row.itemsNumber.toString())),
                        DataCell(
                            Text("\$ ${row.totalItems.toStringAsFixed(2)}")),
                        DataCell(Text(row.adjustmentsNumber.toString())),
                        DataCell(Text(
                            "\$ ${row.totalAdditions.toStringAsFixed(2)}")),
                        DataCell(Text(
                            "\$ ${row.totalDiscounts.toStringAsFixed(2)}")),
                        DataCell(Text(row.attachmentsNumber.toString())),
                        DataCell(Text("\$ ${row.total.toStringAsFixed(2)}")),
                        DataCell(Text(inputFormat.format(row.dateTime))),
                        DataCell(
                          Row(
                            spacing: 2,
                            children: <Widget>[
                              Tooltip(
                                message: "Visualize",
                                child: IconButton(
                                  icon: const Icon(Icons.remove_red_eye,
                                      color: AppColors.grey2),
                                  onPressed: () => context.go("/reports/${row.id}"),
                                ),
                              ),
                              Tooltip(
                                message: "Edit",
                                child: IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {},
                                ),
                              ),
                              Tooltip(
                                message: "Delete",
                                child: IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: AppColors.red1),
                                  onPressed: () => showDeleteDialog(row.id),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
              .values
              .toList(),
        ),
      ),
    );
  }

  void showDeleteDialog(int expenseId) {
    showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text(
              "Delete expense",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
              ),
            ),
            backgroundColor: Colors.white,
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 12,
              children: [
                Text("Are you sure you want to delete this register?"),
                Row(
                  children: [
                    Text("Obs: this action"),
                    Text(" can not ", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("be undone"),
                  ],
                ),
              ],
            ),
            actions: [
              Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                    },
                    child: const Text('Close'),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(AppColors.red1)),
                    onPressed: () {
                      widget.viewModel.deleteExpense(expenseId);
                      Navigator.of(dialogContext).pop();
                    },
                    child: const Text('Delete'),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
