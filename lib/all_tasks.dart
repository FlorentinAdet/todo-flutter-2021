import 'package:flutter/material.dart';
import 'package:todolist/components/tasks/task_details.dart';
import 'package:todolist/components/tasks/task_master.dart';
import 'package:todolist/models/task.dart';
import 'data/tasks_collection.dart';
import 'package:provider/provider.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  Task? selectedTask;

  void onTaskClicked(Task task) {
    setState(() {
      selectedTask = task;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Consumer<TasksCollection>(builder: (context, tasks, child) {
        return Center(
          child: Column(
          children: [
            selectedTask != null
                ? TaskDetail(task: selectedTask!, onDelete: (Task task) {
                  setState(() {
                    selectedTask = null;
                  });
                  tasks.deleteTask(task);
                })
                : Container(),
            Expanded(
              child: TaskMaster(
              todos: tasks.getTasks(), taskClicked: onTaskClicked)),
          ],
        ),);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.pushNamed(context, '/create_task');},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
