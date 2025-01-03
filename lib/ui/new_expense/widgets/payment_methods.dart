import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_finance/domain/models/payment_method.dart';
import 'package:personal_finance/ui/core/themes/colors.dart';
import 'package:personal_finance/ui/core/themes/default_metrics.dart';
import 'package:personal_finance/ui/new_expense/view_models/new_expense_viewmodel.dart';
import 'package:provider/provider.dart';

class PaymentMethods extends StatefulWidget {
  final NewExpenseViewModel viewModel;

  const PaymentMethods({super.key, required this.viewModel});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 15,
      children: [
        DropdownMenu(
          controller: controller,
          label: const Text('Add payment method'),
          width: 220,
          inputDecorationTheme: Theme.of(context).inputDecorationTheme,
          dropdownMenuEntries: widget.viewModel.paymentMethodsList
              .map((PaymentMethod paymentMethod) {
            return DropdownMenuEntry(
              value: paymentMethod.id,
              label: paymentMethod.name,
            );
          }).toList(),
          alignmentOffset: const Offset(250, 0),
          onSelected: (e) => widget.viewModel.addPaymentMethod(e!),
        ),
        ...widget.viewModel.paymentMethods.map(
          (PaymentMethod paymentMethod) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                onPressed: () => widget.viewModel.removePaymentMethod(paymentMethod),
                label: Text(paymentMethod.name),
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
