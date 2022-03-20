import 'package:flutter/material.dart';
import '../components/tasks/task_form.dart';
import '../models/task.dart';

class ScreenArguments {
  final Task task;

  ScreenArguments(this.task);
}

class UpdateTask extends StatelessWidget {
  const UpdateTask({Key? key}) : super(key: key);

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Task'),
      ),
      body: TaskForm(task: args.task),
    );
  }
}