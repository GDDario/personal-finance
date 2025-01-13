import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_finance/data/mock/adjustments_mock.dart';
import 'package:personal_finance/domain/models/adjustment.dart';
import 'package:personal_finance/domain/models/establishment.dart';
import 'package:personal_finance/ui/core/themes/colors.dart';
import 'package:personal_finance/ui/core/ui/searchable_pick_list_modal.dart';
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
  List<Widget> formFields = [];

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Wrap(
        spacing: 15,
        runSpacing: 20,
        children: <Widget>[
          SizedBox(
            width: 220,
            child: Directionality(
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
          ),
          ...formFields
        ],
      ),
    );
  }

  void _openAdjustmentOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return SearchablePickListModal(
          dialogContext: dialogContext,
          title: 'Choose an adjustment to add',
          children:
              widget.viewModel.adjustmentsList.map((Adjustment adjustment) {
            return ListTile(
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
              onTap: () {
                _addFormField(adjustment);
                Navigator.of(dialogContext).pop();
              },
            );
          }).toList(),
        );
      },
    );
  }

  void _addFormField(Adjustment adjustment) {
    final GlobalKey formKey = GlobalKey();

    Widget formField = SizedBox(
      key: formKey,
      width: 220,
      child: TextFormField(
        initialValue: "0",
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ], //
        decoration: InputDecoration(
          label: Text("${adjustment.name} (${adjustment.typeString()})"),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: IconButton(
              onPressed: () => _removeFormField(formKey, adjustment),
              icon: const Icon(Icons.close),
            ),
          ),
        ),
        onChanged: (String value) =>
            widget.viewModel.updateAdjustment(adjustment, double.parse(value)),
      ),
    );

    widget.viewModel.addAdjustment(adjustment);

    setState(() {
      formFields.add(formField);
    });
  }

  void _removeFormField(GlobalKey formKey, Adjustment adjustment) {
    widget.viewModel.removeAdjustment(adjustment);

    setState(() {
      formFields.removeWhere((field) => field.key == formKey);
    });
  }
}
