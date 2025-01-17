import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
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
                                  onPressed: () {},
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
                                  onPressed: () {},
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
}
