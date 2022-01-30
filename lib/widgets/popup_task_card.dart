import 'package:flutter/material.dart';
import 'package:time_table_app/model/task_model.dart';


class PopupTaskCard extends StatelessWidget {
  const PopupTaskCard({Key? key, required this.task, required this.color}) : super(key: key);

  final Task task;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: task.id,
        child: SingleChildScrollView(
          child: Material(
            color: const Color.fromARGB(0, 0, 0, 0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: color,
                ),
                width: double.maxFinite,
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(title: task.title),
                    DeadlineText(deadline: task.deadline),
                    SizedBox(height: 10),
                    Visibility(
                      visible: task.description.isNotEmpty,
                      child: DescriptionText(color: color, description: task.description),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class DeadlineText extends StatelessWidget {
  const DeadlineText({
    Key? key,
    required this.deadline,
  }) : super(key: key);

  final DateTime deadline;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Deadline: ${deadline.day}/${deadline.month}/${deadline.year} ${deadline.hour}:${deadline.minute}",
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    Key? key,
    required this.color,
    required this.description,
  }) : super(key: key);

  final Color color;
  final String description;

  Color lighten(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var p = percent / 100;
    return Color.fromARGB(
        c.alpha,
        c.red + ((255 - c.red) * p).round(),
        c.green + ((255 - c.green) * p).round(),
        c.blue + ((255 - c.blue) * p).round()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lighten(color, 30),
        borderRadius: BorderRadius.circular(8.0),
      ),
      width: double.maxFinite,
      padding: EdgeInsets.all(6.0),
      child: Text(
        description,
        style: TextStyle(
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}
