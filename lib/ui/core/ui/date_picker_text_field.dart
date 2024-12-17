import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DatePickerTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const DatePickerTextField({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: [MaskTextInputFormatter(mask: "####-##-##")],
      decoration: InputDecoration(
        // hintStyle: const TextStyle(color: Colors.black45),
        // errorStyle: const TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4)
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: IconButton(
            onPressed: () {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now())
                  .then((pickedDate) {
                if (pickedDate == null) {
                  return;
                }
                controller.text = DateFormat("yyyy-MM-dd").format(pickedDate);
              });
            },
            icon: const Icon(Icons.event_note),
          ),
        ),
        labelText: "Date",
      ),
    );
  }
}
