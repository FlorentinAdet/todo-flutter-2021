import 'package:flutter/material.dart';
import 'package:todolist/screens/one_task.dart';
import '../../models/task.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({Key? key, required this.task, required this.onDelete}) : super(key: key);

  final Task task;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    Color colorBack;
    if(task.completed == true){
      colorBack = Colors.green;
    }else{
      colorBack = Colors.red;
    }
    return Container(
      color: colorBack,
      child: Column(
        children: [
          Text(task.id.toString()+" "+task.content+" "+task.createdAt.toString()),
          
           TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {Navigator.pushNamed(
                            context,
                            UpdateTask.routeName,
                            arguments: ScreenArguments(
                              task
                            ),
                          );
                        },
            child: const Text('Update'),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {
              final snackBar = SnackBar(
                content: const Text('Confirm to delete this Task ?'),
                action: SnackBarAction(
                  label: 'Yes',
                  onPressed: () {
                   onDelete(task);
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
