import 'package:flutter/material.dart';
import 'package:time_table_app/widgets/task_card.dart';
import 'package:time_table_app/model/task_model.dart';
import 'package:time_table_app/database/database.dart';


class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {

  List<Widget> tasks = [];
  bool loading = true;
  Future<void> generateTasks() async{
    setState(() {
      loading = true;
    });
    List<Task> taskInfo = await Database.getTasks();

    for (Task task in taskInfo){
      tasks.add(TaskCard(task: task));
    }
    setState(() {
      loading = false;
    });
  }

  void initState() {
    super.initState();
    generateTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tasks"), ),
      body: loading ? Center(child: CircularProgressIndicator()) : ListView(
        children: tasks,
      ),
    );
  }
}
