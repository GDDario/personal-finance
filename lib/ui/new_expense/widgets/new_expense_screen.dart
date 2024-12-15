import 'package:flutter/material.dart';
import 'package:personal_finance/ui/core/themes/default_metrics.dart';

class NewExpenseScreen extends StatefulWidget {
  const NewExpenseScreen({super.key});

  @override
  State<NewExpenseScreen> createState() => _NewExpenseScreenState();
}

class _NewExpenseScreenState extends State<NewExpenseScreen> {
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
            SizedBox(
              height: 40,
            ),
            DropdownMenu(
              label: Text('Payment method'),
              width: 220,
              dropdownMenuEntries: [],
              onSelected: (_) {},
            ),
          ],
        ),
      ),
    );
  }
}
