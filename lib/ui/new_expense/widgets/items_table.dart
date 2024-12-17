import 'package:flutter/material.dart';
import 'package:personal_finance/ui/core/themes/default_metrics.dart';
import 'package:data_table_2/data_table_2.dart';

class ItemsTable extends StatelessWidget {
  const ItemsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 800),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius:
                BorderRadius.circular(DefaultMetrics.fieldBorderRadius),
          ),
          height: 365,
          child: DataTable2(
            sortAscending: false,
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            smRatio: 0.75,
            lmRatio: 0.15,
            columns: const <DataColumn>[
              DataColumn2(label: Text('Id')),
              DataColumn(label: Text("Name")),
              DataColumn(label: Text("Category")),
              DataColumn(label: Text("Price")),
              DataColumn(label: Text("Quantity")),
              DataColumn(label: Text("Total")),
            ],
            rows: <DataRow>[],
          )),
    );
  }
}
