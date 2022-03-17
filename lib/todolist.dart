import 'package:flutter/material.dart';
import 'all_tasks.dart';
import '../data/tasks.dart' as data;

class Todolist extends StatelessWidget {
  const Todolist({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'CaviarDreams',
      ),
      home: AllTasks(title: 'Todo List Home Page', tasks: data.tasks),
    );
  }
}
