import 'package:flutter/material.dart';
import 'package:personal_finance/ui/core/ui/search_text_field.dart';
import 'package:personal_finance/ui/core/ui/searchable_pick_list_modal.dart';
import 'package:personal_finance/ui/new_expense/view_models/new_expense_viewmodel.dart';

class SearchEstablishmentTextField extends StatefulWidget {
  final TextEditingController controller;
  final NewExpenseViewModel viewModel;

  const SearchEstablishmentTextField({
    super.key,
    required this.controller,
    required this.viewModel,
  });

  @override
  State<SearchEstablishmentTextField> createState() =>
      _SearchEstablishmentTextFieldState();
}

class _SearchEstablishmentTextFieldState
    extends State<SearchEstablishmentTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: SearchTextField(
        controller: widget.controller,
        label: 'Establishment',
        onIconPressed: _openEstablishmentsDialog,
      ),
    );
  }

  void _openEstablishmentsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return SearchablePickListModal(
            dialogContext: dialogContext,
            title: 'Choose an establishment to add',
            children: widget.viewModel.establishments.map((item) {
              return ListTile(
                title: Text(item.name),
                trailing: const Icon(Icons.add),
                onTap: () {
                  Navigator.of(dialogContext).pop();
                  widget.controller.text = item.name;
                  widget.viewModel.establishment = item;
                },
              );
            }).toList());
      },
    );
  }
}
