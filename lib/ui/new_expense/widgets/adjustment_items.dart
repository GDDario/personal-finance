import 'package:flutter/material.dart';
import 'package:personal_finance/domain/models/adjustment.dart';
import 'package:personal_finance/ui/core/themes/colors.dart';
import 'package:personal_finance/ui/core/themes/default_metrics.dart';
import 'package:personal_finance/ui/new_expense/view_models/new_expense_viewmodel.dart';

class AdjustmentItems extends StatefulWidget {
  final NewExpenseViewModel viewModel;

  const AdjustmentItems({
    super.key,
    required this.viewModel,
  });

  @override
  State<AdjustmentItems> createState() => _AdjustmentItemsState();
}

class _AdjustmentItemsState extends State<AdjustmentItems> {
  List<Widget> items = [];

  @override
  void initState() {
    _initiateItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      children: <Widget>[
        Directionality(
          textDirection: TextDirection.rtl,
          child: ElevatedButton.icon(
            onPressed: _openAdjustmentOptionsDialog,
            label: const Text('Add discount/addition'),
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  void _openAdjustmentOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DefaultMetrics.borderRadius),
          ),
          title: Text(
            'Choose an adjustment to add',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
            ),
          ),
          backgroundColor: Colors.white,
          content: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 700),
            child: SizedBox(
              width: 400,
              child: SingleChildScrollView(
                child: Column(
                  children: items,
                ),
              ),
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  void _initiateItems() {
    int lastIndex = widget.viewModel.adjustments.length - 1;

    for (int i = 0; i < widget.viewModel.adjustments.length; i++) {
      Adjustment adjustment = widget.viewModel.adjustments[i];

      items.add(ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(adjustment.typeString(), style: const TextStyle(fontSize: 12)),
            Text(adjustment.name)
          ],
        ),
        trailing: const Icon(Icons.add),
        onTap: () {},
      ));

      if (i != lastIndex) {
        items.add(const Divider(
          color: AppColors.grey1,
        ));
      }
    }
  }
}
