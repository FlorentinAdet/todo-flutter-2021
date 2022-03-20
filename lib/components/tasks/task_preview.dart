
import 'package:flutter/material.dart';
import '../../models/task.dart';

class TaskPreview extends StatelessWidget {
  const TaskPreview({Key? key, required this.task,required this.taskClicked}) : super(key: key);

  final Task task;
  final Function taskClicked;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.content),
      onTap: ()=> taskClicked(task) 
    );
  }
}
