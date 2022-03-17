import 'package:flutter/material.dart';
import 'package:todolist/components/tasks/task_preview.dart';
import 'package:todolist/models/task.dart';

class TaskMaster extends StatelessWidget {
  const TaskMaster({Key? key, required this.todos, required this.TaskClicked}) : super(key: key);
  
  final List<Task> todos;
  final Function(Task) TaskClicked;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return TaskPreview(task: todos[index],TaskClicked: TaskClicked);
      },
    );
  }
}