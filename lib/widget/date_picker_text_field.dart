import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DatePickerTextField extends StatelessWidget {
  final TextEditingController controller;

  const DatePickerTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: [MaskTextInputFormatter(mask: "##/##/####")],
      style: TextStyle(fontSize: 14.0),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.black45),
        errorStyle: TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
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
              controller.text = DateFormat("dd/MM/yyyy").format(pickedDate);
            });
          },
          icon: Icon(Icons.event_note),
        ),
        labelText: "Data",
      ),
    );
  }
}
