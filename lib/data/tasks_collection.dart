import 'package:flutter/cupertino.dart';
import 'tasks.dart' as data;
import '../models/task.dart';

class TasksCollection extends ChangeNotifier {
  static List<Task> tasks = data.tasks;


  List<Task> getTasks(){
    return tasks;
  }

  createTask(Task task){
    tasks.add(task);
    notifyListeners();
  }
  updateTask(int task,Task updateTask){
    int index = tasks.indexWhere((item)=>item.id==task);
    tasks[index] = updateTask;
    notifyListeners(); 
    return 'todo updated';
  }
  deleteTask(Task task){
    tasks.removeWhere((item)=>item.id==task.id);
    notifyListeners();
  } 
  lenght(){
    return tasks.length+1;
  }
}