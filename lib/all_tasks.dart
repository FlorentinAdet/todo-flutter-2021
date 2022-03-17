import 'package:flutter/material.dart';
import 'package:todolist/components/tasks/task_details.dart';
import 'package:todolist/components/tasks/task_master.dart';
import 'package:todolist/models/task.dart';
import 'package:faker/faker.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key, required this.title, required this.tasks}) : super(key: key);
  final String title;
  final List<Task> tasks;

  @override
  State<AllTasks> createState() => _AllTasksState();
  
}

class _AllTasksState extends State<AllTasks> {
  Task? selectedTask;

  
  
  void _addTask() {
    setState(() {
      widget.tasks.insert(0, Task(
          widget.tasks.length+1,
          faker.lorem.word(),
          random.boolean(),
          faker.date.dateTime(minYear: 2020, maxYear: 2021)
        )
      );
    });
  }
  
  void _deleteTask(Task task){
    setState(() {
      widget.tasks.remove(task);
    });
  }

  void _selectTask(Task task){
      selectedTask = task;
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(
        child: Column(
            children: [
              if(selectedTask is Task)
                TaskDetail(task: selectedTask!, 
                  TaskDelete: (Task taskClicked) {
                      _deleteTask(taskClicked);
                  }),
                Expanded(
                  child: TaskMaster(
                    todos: widget.tasks,
                    TaskClicked: (Task taskClicked) {
                      _selectTask(taskClicked);
                    },
                  ),
                ),
            ],
          )
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
