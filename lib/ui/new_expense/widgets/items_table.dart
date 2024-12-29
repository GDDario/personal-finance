import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance/ui/new_expense/view_models/new_expense_viewmodel.dart';
import 'package:provider/provider.dart';

class ItemsTable extends StatefulWidget {
  final NewExpenseViewModel viewModel;

  const ItemsTable({super.key, required this.viewModel});

  @override
  State<ItemsTable> createState() => _ItemsTableState();
}

class _ItemsTableState extends State<ItemsTable> {
  @override
  Widget build(BuildContext context) {
    final rows = context.watch<NewExpenseViewModel>().tableItems;

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
            DataColumn(label: Text("Value")),
            DataColumn(label: Text("Quantity")),
            DataColumn(label: Text("Total")),
          ],
          rows: rows
              .asMap()
              .map((i, row) {
                return MapEntry(
                    i,
                    DataRow(
                      cells: [
                        DataCell(Text(row.id)),
                        DataCell(Text(row.name)),
                        DataCell(Text(row.categoryName)),
                        DataCell(SelectableItemText(
                          mask: "\$ ",
                          value: "\$ ${row.value.toStringAsFixed(2)}",
                          callback: (dynamic newValue) =>
                              widget.viewModel.changeItemPrice(newValue, i),
                        )),
                        DataCell(SelectableItemText(
                            value: row.quantity.toString(),
                            callback: (dynamic newValue) =>
                                widget.viewModel.changeQuantity(newValue, i))),
                        DataCell(Text("\$ ${row.total.toStringAsFixed(2)}")),
                      ],
                    ));
              })
              .values
              .toList(),
        ),
      ),
    );
  }
}

class SelectableItemText extends StatefulWidget {
  final dynamic value;
  final String? mask;
  final Function(dynamic) callback;

  const SelectableItemText({
    super.key,
    required this.value,
    this.mask,
    required this.callback,
  });

  @override
  State<SelectableItemText> createState() => _SelectableItemTextState();
}

class _SelectableItemTextState extends State<SelectableItemText> {
  bool isSelected = false;
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    updateTextValueFromWidget();

    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        updateField();
      }
    });
  }

  @override
  void didUpdateWidget(SelectableItemText oldWidget) {
    super.didUpdateWidget(oldWidget);

    updateTextValueFromWidget();
  }

  void updateTextValueFromWidget() {
    controller.text = widget.value.toString().replaceAll("\$ ", "");
  }

  void updateField() {
    setState(() {
      isSelected = false;
      widget.callback(controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = true;
          focusNode.requestFocus();
          controller.selection = TextSelection(
            baseOffset: 0,
            extentOffset: controller.value.text.length,
          );
        });
      },
      child: isSelected
          ? TextField(
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.black45),
                errorStyle: const TextStyle(color: Colors.redAccent),
                border: const OutlineInputBorder(),
                prefix: Text(
                  widget.mask ?? "",
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              controller: controller,
              onSubmitted: (_) => updateField(),
              focusNode: focusNode,
            )
          : Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
              child: Text(widget.value),
            ),
    );
  }
}
