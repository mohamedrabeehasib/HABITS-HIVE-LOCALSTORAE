import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:habit/main.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final bool habitComplete;
  final void Function(bool?)? onChanged;
  final void Function(BuildContext)? onPressed;

  const HabitTile(
      {super.key,
      required this.habitName,
      required this.habitComplete,
      required this.onChanged,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
          motion: const Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: StretchMotion(),
          ),
          children: [
            SlidableAction(
              onPressed: onPressed,
              backgroundColor: Colors.red,
              icon: Icons.delete,
            )
          ]),
      child: Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Checkbox(value: habitComplete, onChanged: onChanged),
            Text(
              habitName,
              style: acme.copyWith(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
