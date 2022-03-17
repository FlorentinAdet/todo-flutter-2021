
import 'package:flutter/material.dart';
import '../../models/task.dart';

class TaskPreview extends StatelessWidget {
  const TaskPreview({Key? key, required this.task,required this.TaskClicked}) : super(key: key);

  final Task task;
  final Function(Task) TaskClicked;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.content),
      onTap: TaskClicked(task) 
    );
  }
}
