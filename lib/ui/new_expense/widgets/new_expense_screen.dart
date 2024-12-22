import 'package:flutter/material.dart';
import 'package:personal_finance/ui/core/themes/default_metrics.dart';
import 'package:personal_finance/ui/core/ui/date_picker_text_field.dart';
import 'package:personal_finance/ui/core/ui/search_text_field.dart';
import 'package:personal_finance/ui/new_expense/view_models/new_expense_viewmodel.dart';
import 'package:personal_finance/ui/new_expense/widgets/adjustments.dart';
import 'package:personal_finance/ui/new_expense/widgets/attachments.dart';
import 'package:personal_finance/ui/new_expense/widgets/items_table.dart';

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
                      SizedBox(
                        width: 220,
                        child: SearchTextField(
                          controller: _establishmentController,
                          label: 'Establishment',
                          onIconPressed: () {},
                        ),
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
                      SizedBox(
                        width: 220,
                        child: SearchTextField(
                          controller: _itemController,
                          label: 'Search for an item',
                          onIconPressed: () {},
                        ),
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
                  ItemsTable(
                    rows: widget.viewModel.tableItems,
                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
