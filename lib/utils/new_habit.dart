import 'package:flutter/material.dart';
import 'package:habit/main.dart';

class NewHabit extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const NewHabit({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "New Habit",
        style: acme.copyWith(),
      ),
      content: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple.shade200)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple)),
        ),
      ),
      actions: [
        TextButton(
            onPressed: onCancel,
            child: Text(
              "Cancel",
              style: acme.copyWith(fontSize: 18),
            )),
        TextButton(
            onPressed: onSave,
            child: Text(
              "Save",
              style: acme.copyWith(fontSize: 18),
            )),
      ],
    );
  }
}
