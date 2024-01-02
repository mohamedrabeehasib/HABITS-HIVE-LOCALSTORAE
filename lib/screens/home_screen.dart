import 'package:flutter/material.dart';
import 'package:habit/data_base.dart';
import 'package:habit/utils/new_habit.dart';
import 'package:habit/utils/habit_tile.dart';
import 'package:habit/utils/my_fav.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DataBase db = DataBase();
  final _myBox = Hive.box("box");
  @override
  void initState() {
    super.initState();
    // 1st time ever opeinig this app
    _myBox.get("HABIT") == null ? db.intialDataBase() : db.loadData();
  }

  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.todayHabitList[index][1] = value;
    });
    db.updataData();
  }

  final _newHabitController = TextEditingController();
  // create a new habit
  createNewHabit() {
    showDialog(
        context: context,
        builder: (context) {
          return NewHabit(
              controller: _newHabitController,
              onSave: saveHabit,
              onCancel: cancelHabit);
        });
  }

  //  save new habit
  void saveHabit() {
    setState(() {
      setState(() => db.todayHabitList.add([_newHabitController.text, false]));
      _newHabitController.clear();
      Navigator.of(context).pop();
      db.updataData();
    });
  }

  //  cancel new habit
  void cancelHabit() {
    _newHabitController.clear();
    Navigator.of(context).pop();
  }

  // delete new habit
  deleteHabit(int index) {
    setState(() => db.todayHabitList.removeAt(index));
    db.updataData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("MY HABITS"),
        ),
        floatingActionButton: CreateHabitActionButton(
          onPressed: createNewHabit,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: db.todayHabitList.length,
              itemBuilder: (context, index) => HabitTile(
                    habitName: db.todayHabitList[index][0],
                    habitComplete: db.todayHabitList[index][1],
                    onChanged: (value) => checkBoxTapped(value, index),
                    onPressed: (context) => deleteHabit(index),
                  )),
        ));
  }
}
