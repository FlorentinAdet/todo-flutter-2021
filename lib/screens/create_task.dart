import 'package:flutter/material.dart';
import '../components/tasks/task_form.dart';
import '../models/task.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  Task task = Task(-1,"", false, DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: TaskForm(task: task),
    );
  }
}
