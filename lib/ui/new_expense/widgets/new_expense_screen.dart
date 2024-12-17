import 'package:flutter/material.dart';
import 'package:personal_finance/ui/core/themes/default_metrics.dart';
import 'package:personal_finance/ui/core/ui/date_picker_text_field.dart';
import 'package:personal_finance/ui/core/ui/search_text_field.dart';
import 'package:personal_finance/ui/new_expense/view_models/new_expense_viewmodel.dart';

class NewExpenseScreen extends StatefulWidget {
  final NewExpenseViewModel viewModel;

  const NewExpenseScreen({super.key, required this.viewModel});

  @override
  State<NewExpenseScreen> createState() => _NewExpenseScreenState();
}

class _NewExpenseScreenState extends State<NewExpenseScreen> {
  late List<DropdownMenuEntry> items;
  final TextEditingController dateController = TextEditingController();
  final TextEditingController establishmentController = TextEditingController();

  @override
  void initState() {
    items = widget.viewModel.menuItems;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
            Row(
              spacing: 15,
              children: <Widget>[
                DropdownMenu(
                  label: const Text('Payment method'),
                  width: 220,
                  initialSelection: items.first.value,
                  inputDecorationTheme: Theme.of(context).inputDecorationTheme,
                  dropdownMenuEntries: items,
                  onSelected: (_) {},
                ),
                 SizedBox(
                  width: 220,
                  child: SearchTextField(
                    controller: establishmentController,
                    label: 'Establishment',
                    onIconPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 220,
                  child: DatePickerTextField(
                    controller: dateController,
                    labelText: 'Date',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
