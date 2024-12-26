import 'package:flutter/material.dart';
import 'package:personal_finance/data/mock/adjustment_mock.dart';
import 'package:personal_finance/data/mock/establishments_mock.dart';
import 'package:personal_finance/data/mock/payment_method_mock.dart';
import 'package:personal_finance/data/mock/products_mock.dart';
import 'package:personal_finance/domain/models/adjustment.dart';
import 'package:personal_finance/domain/models/attachment.dart';
import 'package:personal_finance/domain/models/establishment.dart';
import 'package:personal_finance/domain/models/generic_item.dart';

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
  List<DataRow> tableItems = [
    DataRow(cells: [
      DataCell(Text(productsMock.first.id.toString())),
      DataCell(Text(productsMock.first.name)),
      DataCell(Text(productsMock.first.category.name)),
      DataCell(Text(productsMock.first.price.toStringAsFixed(2))),
      DataCell(Text(1.toString())),
      DataCell(Text(productsMock.first.price.toStringAsFixed(2))),
    ]),
    DataRow(cells: [
      DataCell(Text(productsMock[1].id.toString())),
      DataCell(Text(productsMock[1].name)),
      DataCell(Text(productsMock[1].category.name)),
      DataCell(Text(productsMock[1].price.toStringAsFixed(2))),
      DataCell(Text(1.toString())),
      DataCell(Text(productsMock[1].price.toStringAsFixed(2))),
    ]),
    DataRow(cells: [
      DataCell(Text(productsMock[2].id.toString())),
      DataCell(Text(productsMock[2].name)),
      DataCell(Text(productsMock[2].category.name)),
      DataCell(Text(productsMock[2].price.toStringAsFixed(2))),
      DataCell(Text(1.toString())),
      DataCell(Text(productsMock[2].price.toStringAsFixed(2))),
    ]),
    DataRow(cells: [
      DataCell(Text(productsMock[3].id.toString())),
      DataCell(Text(productsMock[3].name)),
      DataCell(Text(productsMock[3].category.name)),
      DataCell(Text(productsMock[3].price.toStringAsFixed(2))),
      DataCell(Text(1.toString())),
      DataCell(Text(productsMock[3].price.toStringAsFixed(2))),
    ]),
  ];
  List<Adjustment> adjustments = adjustmentsMock;
  List<Attachment> attachments = [];
  List<Establishment> establishments = establishmentsMock;
  late Establishment establishment;
  List<GenericItem> items = productsMock;
  List<GenericItem> selectedItems = [];

  void addDataRow() {}
}
