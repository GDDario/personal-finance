import 'package:flutter/material.dart';
import 'package:personal_finance/data/mock/expenses_mock.dart';
import 'package:personal_finance/domain/models/expense.dart';
import 'package:personal_finance/ui/reports/models/expenses_table_row_data.dart';

class ReportsViewModel extends ChangeNotifier {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  List<Expense> expenses = expensesMock;
  List<ExpensesTableRowData> tableItems = [];

  void loadExpenses() {
    expenses = expensesMock;
    tableItems = expenses.map((Expense expense) {
      return ExpensesTableRowData(
        expense.id,
        expense.establishment.name,
        expense.items.length,
        expense.totalItems,
        expense.adjustments.length,
        expense.totalAdditions,
        expense.totalDiscounts,
        expense.attachments.length,
        expense.total,
        expense.dateTime,
      );
    }).toList();
    notifyListeners();
  }

  void filterTable() {
    String startDateRaw = startDateController.text;
    String endDateRaw = endDateController.text;
    DateTime? startDate = null;
    DateTime? endDate = null;

    if(DateTime.tryParse(startDateRaw) != null){
      startDate = DateTime.parse(startDateRaw);
    }

    if(DateTime.tryParse(endDateRaw) != null){
      endDate = DateTime.parse(endDateRaw);
    }

    tableItems = expenses.where((Expense expense) {
      if (startDate != null) {
        if (expense.dateTime.isBefore(startDate)) {
          return false;
        }
      }

      if (endDate != null) {
        if (expense.dateTime.isAfter(endDate)) {
          return false;
        }
      }

      return true;
    }).map((Expense expense) {
      return ExpensesTableRowData(
        expense.id,
        expense.establishment.name,
        expense.items.length,
        expense.totalItems,
        expense.adjustments.length,
        expense.totalAdditions,
        expense.totalDiscounts,
        expense.attachments.length,
        expense.total,
        expense.dateTime,
      );
    }).toList();

    notifyListeners();
  }
}
