import 'package:flutter/material.dart';
import 'package:personal_finance/ui/new_expense/view_models/new_expense_viewmodel.dart';

class SummaryTable extends StatelessWidget {
  final NewExpenseViewModel viewModel;
  const SummaryTable({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    double total = viewModel.total;
    double totalItems = viewModel.totalItems;
    double totalDiscounts = viewModel.totalDiscounts;
    double totalAdditions = viewModel.totalAdditions;

    return Row(
      spacing: 15,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (totalItems > 0)
              Text(
                'Items:',
                style:
                Theme.of(context).textTheme.bodyLarge,
              ),
            if (totalAdditions > 0)
              Text(
                'Additions:',
                style:
                Theme.of(context).textTheme.bodyLarge,
              ),
            if (totalDiscounts > 0)
              Text(
                'Discounts:',
                style:
                Theme.of(context).textTheme.bodyLarge,
              ),
            Text(
              "Total:",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (totalItems > 0)
              Text(
                '+ \$ ${totalItems.toStringAsFixed(2)}',
                style:
                Theme.of(context).textTheme.bodyLarge,
              ),
            if (totalAdditions > 0)
              Text(
                '+ \$ ${totalAdditions.toStringAsFixed(2)}',
                style:
                Theme.of(context).textTheme.bodyLarge,
              ),
            if (totalDiscounts > 0)
              Text(
                '- \$ ${totalDiscounts.toStringAsFixed(2)}',
                style:
                Theme.of(context).textTheme.bodyLarge,
              ),
            Text(
              "\$ ${total.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}
