import 'package:flutter/material.dart';
import 'package:personal_finance/data/mock/payment_method_mock.dart';
import 'package:personal_finance/data/mock/products_mock.dart';
import 'package:personal_finance/domain/models/generic_item.dart';

class NewExpenseViewModel extends ChangeNotifier {
  final List<DropdownMenuEntry> menuItems = [
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

  List<DataRow> tableItems = [
    DataRow(cells: [
      DataCell(Text(products.first.id.toString())),
      DataCell(Text(products.first.name)),
      DataCell(Text(products.first.category.name)),
      DataCell(Text(products.first.price.toStringAsFixed(2))),
      DataCell(Text(1.toString())),
      DataCell(Text(products.first.price.toStringAsFixed(2))),
    ]),
    DataRow(cells: [
      DataCell(Text(products[1].id.toString())),
      DataCell(Text(products[1].name)),
      DataCell(Text(products[1].category.name)),
      DataCell(Text(products[1].price.toStringAsFixed(2))),
      DataCell(Text(1.toString())),
      DataCell(Text(products[1].price.toStringAsFixed(2))),
    ]),
    DataRow(cells: [
      DataCell(Text(products[2].id.toString())),
      DataCell(Text(products[2].name)),
      DataCell(Text(products[2].category.name)),
      DataCell(Text(products[2].price.toStringAsFixed(2))),
      DataCell(Text(1.toString())),
      DataCell(Text(products[2].price.toStringAsFixed(2))),
    ]),
    DataRow(cells: [
      DataCell(Text(products[3].id.toString())),
      DataCell(Text(products[3].name)),
      DataCell(Text(products[3].category.name)),
      DataCell(Text(products[3].price.toStringAsFixed(2))),
      DataCell(Text(1.toString())),
      DataCell(Text(products[3].price.toStringAsFixed(2))),
    ]),
    DataRow(cells: [
      DataCell(Text(products[3].id.toString())),
      DataCell(Text(products[3].name)),
      DataCell(Text(products[3].category.name)),
      DataCell(Text(products[3].price.toStringAsFixed(2))),
      DataCell(Text(1.toString())),
      DataCell(Text(products[3].price.toStringAsFixed(2))),
    ]),
    DataRow(cells: [
      DataCell(Text(products[3].id.toString())),
      DataCell(Text(products[3].name)),
      DataCell(Text(products[3].category.name)),
      DataCell(Text(products[3].price.toStringAsFixed(2))),
      DataCell(Text(1.toString())),
      DataCell(Text(products[3].price.toStringAsFixed(2))),
    ]),
    DataRow(cells: [
      DataCell(Text(products[3].id.toString())),
      DataCell(Text(products[3].name)),
      DataCell(Text(products[3].category.name)),
      DataCell(Text(products[3].price.toStringAsFixed(2))),
      DataCell(Text(1.toString())),
      DataCell(Text(products[3].price.toStringAsFixed(2))),
    ]),
  ];

  void addDataRow() {}
}
