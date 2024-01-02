import 'package:hive_flutter/hive_flutter.dart';

class DataBase {
  List todayHabitList = [
    //[habitname , habitCimpleted]
  ];

  // default data
  // initail data
  intialDataBase() {
    todayHabitList = [
      //[habitname , habitCimpleted]
      ["Morning Run", false],
      ["Read Book", false],
      ["Code App", false],
    ];
  }

  final _myBox = Hive.box("box");

  // updata data
  void updataData() {
    _myBox.put("HABIT", todayHabitList);
  }

  // load data
  void loadData() {
    todayHabitList = _myBox.get("HABIT");
  }
}




