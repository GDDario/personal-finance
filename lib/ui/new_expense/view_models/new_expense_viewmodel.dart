import 'package:flutter/material.dart';
import 'package:personal_finance/data/mock/adjustment_mock.dart';
import 'package:personal_finance/data/mock/establishments_mock.dart';
import 'package:personal_finance/data/mock/payment_method_mock.dart';
import 'package:personal_finance/data/mock/products_mock.dart';
import 'package:personal_finance/domain/models/addition.dart';
import 'package:personal_finance/domain/models/adjustment.dart';
import 'package:personal_finance/domain/models/attachment.dart';
import 'package:personal_finance/domain/models/discount.dart';
import 'package:personal_finance/domain/models/establishment.dart';
import 'package:personal_finance/domain/models/generic_item.dart';
import 'package:personal_finance/domain/models/payment_method.dart';
import 'package:personal_finance/domain/models/product.dart';
import 'package:personal_finance/ui/new_expense/model/expense_table_row_data.dart';

class NewExpenseViewModel extends ChangeNotifier {
  double total = 0;
  double totalItems = 0;
  double totalDiscounts = 0;
  double totalAdditions = 0;
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
  final List<PaymentMethod> paymentMethodsList = paymentMethodsMock;
  List<PaymentMethod> paymentMethods = [];
  List<ExpenseTableRowData> tableItems = [];
  List<Adjustment> adjustmentsList = adjustmentsMock;
  List<Adjustment> expenseAdjustments = [];
  List<Attachment> attachments = [];
  List<Establishment> establishments = establishmentsMock;
  late Establishment establishment;
  List<GenericItem> items = productsMock;
  List<GenericItem> selectedItems = [];

  void addPaymentMethod(int index) {
    // For some reason, the index comes as index + 1
    index--;
    PaymentMethod paymentMethod = paymentMethodsList[index];
    if (!paymentMethods.contains(paymentMethod)) {
      paymentMethods.add(paymentMethodsList[index]);
      notifyListeners();
    }
  }

  void removePaymentMethod(PaymentMethod paymentMethod) {
    paymentMethods.remove(paymentMethod);
    notifyListeners();
  }

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
      existingRow.incrementQuantity();
    } else {
      tableItems.add(ExpenseTableRowData(
        id: item.id.toString(),
        name: item.name,
        categoryName: item.category.name,
        value: value,
        total: value,
      ));
    }

    updateState();
  }

  void changeItemPrice(dynamic newValue, int itemIndex) {
    tableItems[itemIndex].changeValue(double.parse(newValue));
    updateState();
  }

  void changeQuantity(dynamic newQuantity, int itemIndex) {
    tableItems[itemIndex].changeQuantity(int.parse(newQuantity));
    updateState();
  }

  void removeTableRow(ExpenseTableRowData row) {
    tableItems.remove(row);
    updateState();
  }

  void addAdjustment(Adjustment adjustment) {
    expenseAdjustments.add(adjustment);
    updateState();
  }

  void updateAdjustment(Adjustment adjustment, double newValue) {
    int index = expenseAdjustments.indexWhere((item) => item == adjustment);
    if (index != -1) {
      expenseAdjustments[index].value = newValue;
    } else {
      print('Adjustment not found.');
    }

    updateState();
  }

  void removeAdjustment(Adjustment adjustment) {
    // TODO: remove and fix the bug that keeps the adjustment value
    adjustment.value = 0;
    expenseAdjustments.remove(adjustment);
    updateState();
  }

  void calculateTotals() {
    double itemsTotal = tableItems.fold(
      0.0,
      (double sum, ExpenseTableRowData element) => sum + element.total,
    );

    var discounts = expenseAdjustments.whereType<Discount>();
    var additions = expenseAdjustments.whereType<Addition>();

    double discountsTotal = discounts.fold(
      0.0,
      (double sum, Discount element) => sum + element.value,
    );
    double additionsTotal = additions.fold(
      0.0,
      (double sum, Addition element) => sum + element.value,
    );

    totalAdditions = additionsTotal;
    totalDiscounts = discountsTotal;

    totalItems = itemsTotal;
    total = totalItems + additionsTotal - discountsTotal;
  }

  void updateState() {
    calculateTotals();
    notifyListeners();
  }
}
