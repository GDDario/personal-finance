import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function() onIconPressed;

  const SearchTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.onIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: IconButton(
            onPressed: onIconPressed,
            icon: const Icon(
              Icons.search,
            ),
          ),
        ),
      ),
    );
  }
}
