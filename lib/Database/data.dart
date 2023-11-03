import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  //refrence
  List todoList = [];
  final _myBox = Hive.box('myBox');

  //Run this mthod if this is the first time opening the app
  void CreateInitData() {
    todoList = [
      ["Play Today", false],
      ['Sleep Today', false]
    ];
  }

//Loaed data from database
  void loadData() {
    todoList = _myBox.get("TODDOLIST");
  }

  //upddate the database
  void upDataBase() {
    _myBox.put("TODOLIST", todoList);
  }
}
