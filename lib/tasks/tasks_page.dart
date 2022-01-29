import 'package:flutter/material.dart';
import 'package:time_table_app/widgets/task_card.dart';
import 'package:time_table_app/model/task_model.dart';
import 'package:time_table_app/database/database.dart';


class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  List<Widget> generateTasks(){
    List<Task> taskInfo = Database.getTasks();
    List<Widget> tasks = [];

    for (Task task in taskInfo){
      tasks.add(TaskCard(task: task));
    }
    return tasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tasks"), ),
      body: ListView(
        children: generateTasks(),
      ),
    );
  }
}
