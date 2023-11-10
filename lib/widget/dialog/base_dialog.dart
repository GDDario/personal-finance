import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseDialog extends StatefulWidget {
  final String title;
  final List<Widget> children;

  const BaseDialog({super.key, required this.title, required this.children});

  @override
  State<BaseDialog> createState() => _BaseDialogState();
}

class _BaseDialogState extends State<BaseDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 400,
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 32.0),
            ...widget.children
          ],
        ),
      ),
    );
  }
}
