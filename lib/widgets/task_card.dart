import 'package:flutter/material.dart';

import 'package:time_table_app/model/task_model.dart';
import 'package:time_table_app/route/popup_route.dart';
import 'package:time_table_app/widgets/popup_task_card.dart';


class TaskCard extends StatelessWidget {
  const TaskCard({Key? key, required this.task, this.color = Colors.blue}) : super(key: key);

  final Task task;
  final Color color;

  void onTapCallback(BuildContext context){
    Navigator.push(context, CustomPopupRoute(builder: (context) => PopupTaskCard(task: this.task, color: this.color,)));
  }

  @override
  Widget build(BuildContext context) {
    String deadline = "${task.deadline.day}/${task.deadline.month}/${task.deadline.year} ";
    deadline += "${task.deadline.hour}:${task.deadline.minute}";
    return Hero(
      tag: task.id,
      child: Card(
        child: ListTile(
          title: Text(
            task.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            deadline,
            style: TextStyle(fontSize: 15),
          ),
          onTap: () => onTapCallback(context),
        ),
        elevation: 0,
        color: color,
        margin: EdgeInsets.zero,
        shape: ContinuousRectangleBorder(),
      ),
    );
  }
}
