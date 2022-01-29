import 'package:flutter/material.dart';
import 'package:time_table_app/tasks/tasks_page.dart';


class TasksButton extends StatelessWidget {
  const TasksButton({Key? key}) : super(key: key);

  void onPressedCallback(BuildContext context){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => TaskPage()
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => onPressedCallback(context),
      label: const Text("Tasks", style: TextStyle(fontSize: 15),),
      icon: const Icon(Icons.check_circle_outline_sharp),
    );
  }
}
