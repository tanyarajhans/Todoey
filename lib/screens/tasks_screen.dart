import 'package:flutter/material.dart';
import 'package:todoey/widgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'package:todoey/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
class TaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(onPressed: () {
        // slide up botton sheet
        showModalBottomSheet(
          context: context,
          builder: (context) => 
           AddTaskScreen((newTaskTitle){
            // setState(() {
            //   Provider.of<TaskData>(context).tasks.add(Task(name: newTaskTitle));
            // });
            Navigator.pop(context);
          }),
        );
      }, backgroundColor: Colors.lightBlueAccent, child: Icon(Icons.add),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Container(
          padding:
              EdgeInsets.only(top: 45.0, left: 30.0, right: 30.0, bottom: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(child: Icon(Icons.list, size: 30.0, color: Colors.lightBlueAccent),
                backgroundColor: Colors.white,
                radius: 30.0,
              ),
              SizedBox(height: 10.0),
              Text('Todoey', style: TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.w400)),
              Text('${Provider.of<TaskData>(context).tasks.length} tasks', style: TextStyle(color: Colors.white, fontSize: 18.0))
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
            ),
            child: TasksList(),
          ),
        )
      ]),
    );
  }
}





