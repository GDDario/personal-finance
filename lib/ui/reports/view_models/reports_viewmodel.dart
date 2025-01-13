import 'package:flutter/material.dart';
import 'package:personal_finance/data/mock/expenses_mock.dart';
import 'package:personal_finance/domain/models/expense.dart';
import 'package:personal_finance/ui/reports/models/expenses_table_row_data.dart';

class ReportsViewModel extends ChangeNotifier {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  List<ExpensesTableRowData> tableItems = expensesMock.map((Expense expense) {
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
}
