import 'package:flutter/material.dart';
import 'package:time_table_app/model/task_model.dart';


class TaskCard extends StatelessWidget {
  const TaskCard({Key? key, required this.task, this.color = Colors.blue}) : super(key: key);

  final Task task;
  final Color color;

  @override
  Widget build(BuildContext context) {
    String deadline = "${task.deadline.day}/${task.deadline.month}/${task.deadline.year} ";
    deadline += "${task.deadline.hour}:${task.deadline.minute}";
    return Card(
      child: ListTile(
        title: Text(
          task.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          deadline,
          style: TextStyle(fontSize: 15),
        ),
      ),
      elevation: 0,
      color: color,
      margin: EdgeInsets.zero,
      shape: ContinuousRectangleBorder(),
    );
  }
}
