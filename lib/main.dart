import 'package:flutter/material.dart';
import 'data/tasks_collection.dart';
import 'todolist.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const Todolist());
  ChangeNotifierProvider(
    create: => new TasksCollection(),
  );
}
