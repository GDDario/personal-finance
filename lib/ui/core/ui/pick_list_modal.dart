import 'package:flutter/material.dart';

class PickListModal extends StatelessWidget {
  final BuildContext dialogContext;
  final String title;
  final List<Widget> children;
  final Function? onClose;

  const PickListModal({
    super.key,
    required this.dialogContext,
    required this.title,
    required this.children,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
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
            child: Column(children: children),
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
                onClose!.call();
              },
              child: const Text('Close'),
            ),
          ],
        ),
      ],
    );
  }
}
