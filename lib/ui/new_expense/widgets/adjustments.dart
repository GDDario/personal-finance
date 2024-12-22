import 'package:flutter/material.dart';
import 'package:personal_finance/domain/models/adjustment.dart';
import 'package:personal_finance/ui/core/themes/colors.dart';
import 'package:personal_finance/ui/core/themes/default_metrics.dart';
import 'package:personal_finance/ui/new_expense/view_models/new_expense_viewmodel.dart';

class Adjustments extends StatefulWidget {
  final NewExpenseViewModel viewModel;

  const Adjustments({
    super.key,
    required this.viewModel,
  });

  @override
  State<Adjustments> createState() => _AdjustmentsState();
}

class _AdjustmentsState extends State<Adjustments> {
  List<Widget> adjustmentModalItems = [];
  List<Widget> formFields = [];

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
        ...formFields
      ],
    );
  }

  void _openAdjustmentOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
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
                  children: adjustmentModalItems.map((item) {
                    if (item is ListTile) {
                      return ListTile(
                        title: item.title,
                        trailing: item.trailing,
                        onTap: () {
                          Navigator.of(dialogContext).pop();
                          if (item.onTap != null) {
                            item.onTap!();
                          }
                        },
                      );
                    }
                    return item;
                  }).toList(),
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
                    Navigator.of(dialogContext).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _initiateItems() {
    int lastIndex = widget.viewModel.adjustments.length - 1;

    for (int i = 0; i < widget.viewModel.adjustments.length; i++) {
      Adjustment adjustment = widget.viewModel.adjustments[i];

      adjustmentModalItems.add(ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              adjustment.typeString(),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            Text(adjustment.name)
          ],
        ),
        trailing: const Icon(Icons.add),
        onTap: () => _addFormField(adjustment),
      ));

      if (i != lastIndex) {
        adjustmentModalItems.add(const Divider(
          color: AppColors.grey1,
        ));
      }
    }
  }

  void _addFormField(Adjustment adjustment) {
    final GlobalKey formKey = GlobalKey();

    Widget formField = SizedBox(
      key: formKey,
      width: 220,
      child: TextFormField(
        decoration: InputDecoration(
          label: Text("${adjustment.name} (${adjustment.typeString()})"),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: IconButton(
              onPressed: () => _removeFormField(formKey),
              icon: const Icon(Icons.close),
            ),
          ),
        ),
      ),
    );

    setState(() {
      formFields.add(formField);
    });
  }

  void _removeFormField(GlobalKey formKey) {
    setState(() {
      formFields.removeWhere((field) => field.key == formKey);
    });
  }
}
