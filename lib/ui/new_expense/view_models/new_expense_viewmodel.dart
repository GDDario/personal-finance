import 'package:flutter/material.dart';
import 'package:personal_finance/data/mock/payment_method_mock.dart';

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
}
