// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class CreateHabitActionButton extends StatelessWidget {
  CreateHabitActionButton({super.key, required this.onPressed});
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
