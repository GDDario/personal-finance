import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    );
  }
}
