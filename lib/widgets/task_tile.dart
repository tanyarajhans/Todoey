import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
 

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  void checkBoxCallBack (bool checkBoxState){
    setState(() {
      isChecked = checkBoxState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('This is a task',
      style: TextStyle(
        decoration: isChecked ? TextDecoration.lineThrough : null
       ),
      ),
      trailing: TaskCheckBox(isChecked, (bool? checkBoxState){
        setState(() {
          isChecked = checkBoxState ?? true;
        });
      }),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool checkBoxState;
  final void Function(bool?) toggleCheckBoxState;

  TaskCheckBox(this.checkBoxState, this.toggleCheckBoxState);

  @override
  Widget build(BuildContext context) {

    return Checkbox(
      activeColor: Colors.lightBlueAccent, 
      value: checkBoxState, 
      onChanged: toggleCheckBoxState,
    );
  }
}


