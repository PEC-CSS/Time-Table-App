import 'package:flutter/material.dart';

import '../model/subject_model.dart';
import 'popup_subject_card.dart';
import 'package:time_table_app/route/popup_route.dart';

class SubjectCard extends StatelessWidget {
  final Subject subject;
  final Widget time;

  SubjectCard({Key? key, required this.subject})
      : time = Text(
          "${subject.startTime.hour.toString().padLeft(2, '0')} ${subject.startTime.minute.toString().padLeft(2, '0')}",
          style: const TextStyle(fontSize: 20),
        ),
        super(key: key);

  void openCard(BuildContext context) {
    Navigator.push(
        context,
        CustomPopupRoute(
            builder: (context) => PopupSubjectCard(
                  subject: subject,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: subject.hashCode,
        child: Card(
          color: subject.color,
          margin: EdgeInsets.zero,
          shape: const Border(),
          child: ListTile(
            leading: time,
            title: Text(
              subject.name,
              style: const TextStyle(fontSize: 21),
            ),
            onTap: () => openCard(context),
          ),
        ),
      ),
    );
  }
}
