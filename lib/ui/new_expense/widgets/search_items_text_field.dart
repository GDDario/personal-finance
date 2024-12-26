import 'package:flutter/material.dart';
import 'package:personal_finance/domain/models/generic_item.dart';
import 'package:personal_finance/domain/models/product.dart';
import 'package:personal_finance/ui/core/ui/searchable_pick_list_modal.dart';
import 'package:personal_finance/ui/new_expense/view_models/new_expense_viewmodel.dart';

class SearchItemsTextField extends StatefulWidget {
  final TextEditingController controller;
  final NewExpenseViewModel viewModel;

  const SearchItemsTextField({
    super.key,
    required this.controller,
    required this.viewModel,
  });

  @override
  State<SearchItemsTextField> createState() => _SearchItemsTextFieldState();
}

class _SearchItemsTextFieldState extends State<SearchItemsTextField> {
  late List<GenericItem> items;

  @override
  void initState() {
    items = widget.viewModel.items;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Autocomplete(
        optionsViewBuilder: (context, onSelected, options) => Align(
          alignment: Alignment.topLeft,
          child: Material(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(4.0)),
            ),
            child: SizedBox(
              height: 77.0 * options.length,
              width: 220, //
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: options.length,
                shrinkWrap: false,
                itemBuilder: (BuildContext context, int index) {
                  final GenericItem option = items.elementAt(index);
                  return InkWell(
                    onTap: () => onSelected(option.name),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        spacing: 5,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  option.name,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(option.category.name),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (option is Product)
                                Text(
                                  'Price: ${option.price.toStringAsFixed(2)}',
                                  overflow: TextOverflow.ellipsis,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        fieldViewBuilder: (BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted) {
          return TextFormField(
              controller: textEditingController,
              focusNode: focusNode,
              onFieldSubmitted: (value) => onFieldSubmitted,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(gapPadding: 1),
                hintText: "Search...",
              ));
        },
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          }
          return widget.viewModel.items
              .map((item) => item.name)
              .where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        },
        // controller: widget.controller,
        // label: 'Search for an item',
        // onIconPressed: _openEstablishmentsDialog,
      ),
    );
  }

  void _openEstablishmentsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return SearchablePickListModal(
            dialogContext: dialogContext,
            title: 'Choose an item to add',
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
