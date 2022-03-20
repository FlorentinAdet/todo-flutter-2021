import 'package:flutter/material.dart';
import 'package:todolist/screens/one_task.dart';
import 'screens/create_task.dart';
import 'all_tasks.dart';

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
      initialRoute: '/all_task',
      routes: {
        '/all_task': (context) => const AllTasks(title: 'Todo List Home Page'),
        '/create_task': (context) => const CreateTask(title: 'Create Todo',),
        UpdateTask.routeName: (context) => const UpdateTask(),
      },
    );
  }
}
