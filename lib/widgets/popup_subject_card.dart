import 'package:flutter/material.dart';

import '../model/subject_model.dart';

class PopupSubjectCard extends StatelessWidget {
  const PopupSubjectCard({Key? key, required this.subject}) : super(key: key);

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(16.0),
        color: const Color.fromARGB(0, 0, 0, 0),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Hero(
                      tag: subject.hashCode,
                      child: Material(
                          borderRadius: BorderRadius.circular(16.0),
                          child: SubjectInfoBox(
                            subject: subject,
                            color: subject.color,
                          ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubjectInfoBox extends StatelessWidget {
  const SubjectInfoBox({
    Key? key,
    required this.subject,
    required this.color,
  }) : super(key: key);

  final Subject subject;
  final Color color;
  final bool isOwned = false;

  Color lighten(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var p = percent / 100;
    return Color.fromARGB(
        c.alpha,
        c.red + ((255 - c.red) * p).round(),
        c.green + ((255 - c.green) * p).round(),
        c.blue + ((255 - c.blue) * p).round());
  }

  @override
  Widget build(BuildContext context) {
    DateTime finishTime = subject.startTime.add(subject.duration);

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          color: color),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subject.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
                """${subject.startTime.hour.toString().padLeft(2, '0')}:${subject.startTime.minute.toString().padLeft(2, '0')} - ${finishTime.hour.toString().padLeft(2, '0')}:${finishTime.minute.toString().padLeft(2, '0')}"""),
            const SizedBox(
              height: 8.0,
            ),
            Visibility(
              visible: subject.description.isNotEmpty,
              child: Container(
                decoration: BoxDecoration(
                  color: lighten(color, 30),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                width: double.maxFinite,
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  subject.description,
                ),
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            TextButton.icon(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(lighten(color, 30))),
              onPressed: () {},
              icon: const Icon(Icons.edit, color: Colors.black, size: 16.0),
              label: Text(
                isOwned ? "Edit" : "Request Edit",
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
