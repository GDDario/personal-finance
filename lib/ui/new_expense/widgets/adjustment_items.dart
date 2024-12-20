import 'package:flutter/material.dart';

class AdjustmentItems extends StatelessWidget {
  const AdjustmentItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: 15, children: <Widget>[
      Directionality(
        textDirection: TextDirection.rtl,
        child: ElevatedButton.icon(
          onPressed: () {},
          label: const Text('Add discount/addition'),
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    ]);
  }
}
