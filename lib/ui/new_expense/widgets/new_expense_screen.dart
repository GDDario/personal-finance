import 'package:flutter/material.dart';
import 'package:personal_finance/ui/core/themes/default_metrics.dart';
import 'package:personal_finance/ui/core/ui/date_picker_text_field.dart';
import 'package:personal_finance/ui/new_expense/view_models/new_expense_viewmodel.dart';
import 'package:personal_finance/ui/new_expense/widgets/adjustments.dart';
import 'package:personal_finance/ui/new_expense/widgets/attachments.dart';
import 'package:personal_finance/ui/new_expense/widgets/items_table.dart';
import 'package:personal_finance/ui/new_expense/widgets/search_establishment_text_field.dart';
import 'package:personal_finance/ui/new_expense/widgets/search_items_text_field.dart';
import 'package:provider/provider.dart';

class NewExpenseScreen extends StatefulWidget {
  final NewExpenseViewModel viewModel;

  const NewExpenseScreen({super.key, required this.viewModel});

  @override
  State<NewExpenseScreen> createState() => _NewExpenseScreenState();
}

class _NewExpenseScreenState extends State<NewExpenseScreen> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _establishmentController =
      TextEditingController();
  final TextEditingController _itemController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _total = widget.viewModel.total;
    double _totalItems = widget.viewModel.totalItems;
    double _totalDiscounts = widget.viewModel.totalDiscounts;
    double _totalAdditions = widget.viewModel.totalAdditions;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DefaultMetrics.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "New expense",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: <Widget>[
                  Row(
                    spacing: 15,
                    children: <Widget>[
                      DropdownMenu(
                        label: const Text('Payment method'),
                        width: 220,
                        initialSelection:
                            widget.viewModel.menuItems.first.value,
                        inputDecorationTheme:
                            Theme.of(context).inputDecorationTheme,
                        dropdownMenuEntries: widget.viewModel.menuItems,
                        alignmentOffset: const Offset(250, 0),
                        onSelected: (_) {},
                      ),
                      SearchEstablishmentTextField(
                        controller: _establishmentController,
                        viewModel: widget.viewModel,
                      ),
                      SizedBox(
                        width: 220,
                        child: DatePickerTextField(
                          controller: _dateController,
                          labelText: 'Date',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 15,
                    children: <Widget>[
                      SearchItemsTextField(
                        controller: _itemController,
                        viewModel: widget.viewModel,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          label: const Text('Add item'),
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  ChangeNotifierProvider(
                    create: (_) => widget.viewModel,
                    child: ItemsTable(
                      viewModel: widget.viewModel,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 20,
                          children: [
                            Row(
                              spacing: 15,
                              children: <Widget>[
                                Adjustments(viewModel: widget.viewModel)
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 15,
                              children: <Widget>[
                                Attachments(viewModel: widget.viewModel),
                                SizedBox(
                                  width: 150,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Row(
                                      children: [
                                        Text('Finish'),
                                        Spacer(),
                                        Icon(
                                          Icons.check_circle_outline,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          spacing: 15,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (_totalItems > 0)
                                  Text(
                                    'Items:',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                if (_totalAdditions > 0)
                                  Text(
                                    'Additions:',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                if (_totalDiscounts > 0)
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
                                if (_totalItems > 0)
                                  Text(
                                    '+ \$ ${_totalItems.toStringAsFixed(2)}',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                if (_totalAdditions > 0)
                                  Text(
                                    '+ \$ ${_totalAdditions.toStringAsFixed(2)}',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                if (_totalDiscounts > 0)
                                  Text(
                                    '- \$ ${_totalDiscounts.toStringAsFixed(2)}',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                Text(
                                  "\$ ${_total.toStringAsFixed(2)}",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
