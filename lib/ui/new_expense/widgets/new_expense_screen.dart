import 'package:flutter/material.dart';
import 'package:personal_finance/ui/core/themes/default_metrics.dart';
import 'package:personal_finance/ui/core/ui/date_picker_text_field.dart';
import 'package:personal_finance/ui/new_expense/view_models/new_expense_viewmodel.dart';
import 'package:personal_finance/ui/new_expense/widgets/adjustments.dart';
import 'package:personal_finance/ui/new_expense/widgets/attachments.dart';
import 'package:personal_finance/ui/new_expense/widgets/items_table.dart';
import 'package:personal_finance/ui/new_expense/widgets/payment_methods.dart';
import 'package:personal_finance/ui/new_expense/widgets/search_establishment_text_field.dart';
import 'package:personal_finance/ui/new_expense/widgets/search_items_text_field.dart';
import 'package:personal_finance/ui/new_expense/widgets/summary_table.dart';
import 'package:provider/provider.dart';

class NewExpenseScreen extends StatefulWidget {
  const NewExpenseScreen({super.key});

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
    final viewModel = context.watch<NewExpenseViewModel>();

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
                      SearchEstablishmentTextField(
                        controller: _establishmentController,
                        viewModel: viewModel,
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
                  PaymentMethods(viewModel: viewModel),
                  Row(
                    spacing: 15,
                    children: <Widget>[
                      SearchItemsTextField(
                        controller: _itemController,
                        viewModel: viewModel,
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
                      ),
                    ],
                  ),
                  ChangeNotifierProvider(
                    create: (_) => viewModel,
                    child: ItemsTable(
                      viewModel: viewModel,
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
                                Adjustments(viewModel: viewModel)
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 15,
                              children: <Widget>[
                                Attachments(viewModel: viewModel),
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
                        ChangeNotifierProvider(
                          create: (_) => viewModel,
                          child: SummaryTable(
                            viewModel: viewModel,
                          ),
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
