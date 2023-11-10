import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function() onClick;

  const SearchTextField({super.key, required this.controller, required this.label, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(fontSize: 14.0),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.black45),
        errorStyle: TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          onPressed: onClick,
          // onPressed: onClick(context),
          icon: Icon(Icons.search),
        ),
        labelText: label,
      ),
    );
  }
}
