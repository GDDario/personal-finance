import 'package:flutter/material.dart';
import 'package:personal_finance/utils/widget_utils.dart';

class SearchablePickListModal extends StatefulWidget {
  final BuildContext dialogContext;
  final String title;
  final List<Widget> children;
  final Function? onClose;

  const SearchablePickListModal({
    super.key,
    required this.dialogContext,
    required this.title,
    required this.children,
    this.onClose,
  });

  @override
  State<SearchablePickListModal> createState() =>
      _SearchablePickListModalState();
}

class _SearchablePickListModalState extends State<SearchablePickListModal> {
  late List<Widget> _filteredChildren;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _filteredChildren = widget.children;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.title,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
        ),
      ),
      backgroundColor: Colors.white,
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 700),
        child: SizedBox(
          width: 400,
          child: Column(
            children: [
              TextFormField(
                controller: _searchController,
                onChanged: _onSearch,
              ),
              SingleChildScrollView(
                child: Column(children: _filteredChildren),
              ),
            ],
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(widget.dialogContext).pop();
                widget.onClose!.call();
              },
              child: const Text('Close'),
            ),
          ],
        ),
      ],
    );
  }

  void _onSearch(String newText) {
    if (newText.isEmpty) {
      setState(() {
        _filteredChildren = widget.children;
      });

      return;
    }

    List<Widget> filteredList = widget.children
        .where((Widget widget) => widgetContainsText(widget, newText))
        .toList();

    setState(() {
      _filteredChildren = filteredList;
    });
  }
}
