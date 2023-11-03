import 'package:todo_app/Pages/todo_app_materialpage.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart'; //

void main() async {
  //init flutter
  await Hive.initFlutter();

  //Open a box
  var box = await Hive.openBox('myBox');

  runApp(const MyApp());
  //widget are building block of ui interface
}
//Material APP//create widget
//Types of widget
//Stateless widget, Stateful widget, inherited widget

//State- data that determine how a widget or screen should look like
//Stateless widget- is immutable , data cannot change at all
//Stateful widget- is muttable
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App",
      home: TodoApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
