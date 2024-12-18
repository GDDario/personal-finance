import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class ItemsTable extends StatelessWidget {
  final List<DataRow> rows;

  const ItemsTable({super.key, required this.rows});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 800),
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
              DataColumn2(label: Text('Id')),
              DataColumn(label: Text("Name")),
              DataColumn(label: Text("Category")),
              DataColumn(label: Text("Price")),
              DataColumn(label: Text("Quantity")),
              DataColumn(label: Text("Total")),
            ],
            rows: rows,
          )),
    );
  }
}
