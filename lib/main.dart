import 'package:flutter/material.dart';
import 'todolist.dart';
import 'data/tasks_collection.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TasksCollection(),
      child: const Todolist(),
    )
  );
}
