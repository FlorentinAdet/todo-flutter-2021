import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import '../../models/task.dart';
import 'package:provider/provider.dart';
import '../../data/tasks_collection.dart';
 
class TaskForm extends StatefulWidget {
  const TaskForm({Key? key, required this.task}) : super(key: key);
  
  final Task task;

  @override  
  TaskFormState createState() {  
    return TaskFormState();  
  }  
}  
class TaskFormState extends State<TaskForm> {  
  final _formKey = GlobalKey<FormState>();  
  final format = DateFormat("yyyy-MM-dd HH:mm"); 
  final myController = TextEditingController();
  final myControllerDate = TextEditingController();
  String test ="yes";
  @override  
  Widget build(BuildContext context) {
    return
      Consumer<TasksCollection>(builder: (context, tasks, child) { 
        return SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Todo name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a Todo name',
                  ),
                  controller: myController..text = widget.task.content,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: DateTimeField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Select a Todo date and time',
                    ),
                    controller: myControllerDate..text = widget.task.createdAt.toString(),
                    format: format,
                    onShowPicker: (context, currentValue) async {
                      final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                      if (date != null) {
                        final time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                        );
                        return DateTimeField.combine(date, time);
                      } else {
                        return currentValue;
                      }
                    },
                  ),
              ), 
              widget.task.id != -1?
               Checkbox(
                  checkColor: Colors.red,
                  value: widget.task.completed,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.task.completed = value!;
                    });
                  },
                ):Container(),           
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if(widget.task.id != -1){
                        int idTask = widget.task.id;
                        Task task = Task(idTask, myController.text, widget.task.completed, DateTime.parse(myControllerDate.text)); 
                        test = tasks.updateTask(idTask, task);
                      }else{
                        Task task = Task(tasks.lenght(), myController.text, false, DateTime.parse(myControllerDate.text)); 
                        tasks.createTask(task);
                        test = "Todo created";                                        
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(test)),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}  