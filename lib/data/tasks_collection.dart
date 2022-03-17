import 'package:flutter/cupertino.dart';

import 'tasks.dart' as data;
import '../models/task.dart';

class TasksCollection extends ChangeNotifier {
  static List<Task> tasks = data.tasks;

  _create(){
    notifyListeners();
  }
  _update(Task task){
    notifyListeners();
  }
  _delete(Task task){
    tasks.remove(task);
    notifyListeners();
  } 
}