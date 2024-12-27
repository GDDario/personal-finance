import 'package:flutter/material.dart';
import 'package:personal_finance/data/mock/adjustment_mock.dart';
import 'package:personal_finance/data/mock/establishments_mock.dart';
import 'package:personal_finance/data/mock/payment_method_mock.dart';
import 'package:personal_finance/data/mock/products_mock.dart';
import 'package:personal_finance/domain/models/adjustment.dart';
import 'package:personal_finance/domain/models/attachment.dart';
import 'package:personal_finance/domain/models/establishment.dart';
import 'package:personal_finance/domain/models/generic_item.dart';
import 'package:personal_finance/domain/models/product.dart';
import 'package:personal_finance/ui/new_expense/model/expense_table_row_data.dart';

class NewExpenseViewModel extends ChangeNotifier {
  final List<DropdownMenuEntry<int>> menuItems = [
    DropdownMenuEntry(
      value: paymentMethodsMock[0].id,
      label: paymentMethodsMock[0].name,
    ),
    DropdownMenuEntry(
      value: paymentMethodsMock[1].id,
      label: paymentMethodsMock[1].name,
    ),
    DropdownMenuEntry(
      value: paymentMethodsMock[2].id,
      label: paymentMethodsMock[2].name,
    ),
    DropdownMenuEntry(
      value: paymentMethodsMock[3].id,
      label: paymentMethodsMock[3].name,
    ),
    DropdownMenuEntry(
      value: paymentMethodsMock[4].id,
      label: paymentMethodsMock[4].name,
    ),
  ];
  List<ExpenseTableRowData> tableItems = [
    ExpenseTableRowData(
      id: productsMock.first.id.toString(),
      name: productsMock.first.name,
      categoryName: productsMock.first.category.name,
      value: productsMock.first.price,
      quantity: 1,
      total: productsMock.first.price,
    ),
    ExpenseTableRowData(
      id: productsMock[1].id.toString(),
      name: productsMock[1].name,
      categoryName: productsMock[1].category.name,
      value: productsMock[1].price,
      quantity: 1,
      total: productsMock[1].price,
    ),
    ExpenseTableRowData(
      id: productsMock[2].id.toString(),
      name: productsMock[2].name,
      categoryName: productsMock[2].category.name,
      value: productsMock[2].price,
      quantity: 1,
      total: productsMock[2].price,
    )
  ];

  List<Adjustment> adjustments = adjustmentsMock;
  List<Attachment> attachments = [];
  List<Establishment> establishments = establishmentsMock;
  late Establishment establishment;
  List<GenericItem> items = productsMock;
  List<GenericItem> selectedItems = [];

  void addDataRow(GenericItem item) {
    double value = 0;

    if (item is Product) {
      value = item.price;
    }

    ExpenseTableRowData? existingRow = tableItems
        .where(
          (row) => row.id == item.id.toString(),
        )
        .firstOrNull;

    if (existingRow != null) {
      existingRow.incrementQuantity(value);
    } else {
      tableItems.add(ExpenseTableRowData(
        id: item.id.toString(),
        name: item.name,
        categoryName: item.category.name,
        value: value,
        total: value,
      ));
    }

    notifyListeners();
  }
}
