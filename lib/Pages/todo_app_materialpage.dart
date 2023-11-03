import 'package:hive/hive.dart';
import 'package:todo_app/Comp/alert_dialog.dart';
import 'package:todo_app/Comp/todo_title.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Database/data.dart';


class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {

  final _myBox = Hive.box('myBox');
  TodoDataBase db = TodoDataBase();
  @override
  void initState() {
  
    //First time ever opening the app
    if (_myBox.get("TODOLIST") == null) {
      db.CreateInitData();
    } else {
      db.loadData();
    }
          super.initState();

  }
    final _controller = TextEditingController(); 

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.upDataBase();
  }
  //To save Task

  void SaveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.upDataBase();
  }
  //To create new task

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: SaveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //To delete task//
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.upDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(38, 70, 70, 0.308),
      appBar: AppBar(
        title: const Text(
          "TODO APP",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTitle(
            taskName: db.todoList[index][0],
            taskComplete: db.todoList[index][1],
            onchangedd: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
