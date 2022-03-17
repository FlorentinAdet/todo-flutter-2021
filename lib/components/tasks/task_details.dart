import 'package:flutter/material.dart';
import '../../models/task.dart';
class TaskDetail extends StatelessWidget {
  const TaskDetail({Key? key, required this.task, required this.TaskDelete}) : super(key: key);

  final Task task;
  final Function(Task) TaskDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(task.id.toString()+" "+task.content+" "+task.createdAt.toString()+" Completed ? "+task.completed.toString()),
           TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
            ),
            onPressed: () { },
            child: Text('Update'),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
            ),
            onPressed: () {
              final snackBar = SnackBar(
                content: const Text('Confirm to delete this Task ?'),
                action: SnackBarAction(
                  label: 'Yes',
                  onPressed: () {
                    TaskDelete(task);
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Text('Delete'),
          ),
        ],
      )
    );
  }
}
