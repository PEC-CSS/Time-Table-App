import 'package:flutter/material.dart';

import '../model/subject_model.dart';
import 'popup_subject_card.dart';
import 'package:time_table_app/route/popup_route.dart';

class SubjectCard extends StatelessWidget {
  final Subject subject;
  final Widget time;

  SubjectCard({Key? key, required this.subject}) :
        this.time = Text(
          "${subject.startTime.hour} ${subject.startTime.minute}",
          style: TextStyle(fontSize: 20),
        ),
        super(key: key);

  void openCard(BuildContext context){
    Navigator.push(context, CustomPopupRoute(
        builder: (context) => PopupSubjectCard(
            subject: this.subject,
        )
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: this.subject.name.hashCode,
        child: Card(
          color: this.subject.color,
          margin: EdgeInsets.zero,
          shape: Border(),
          child:  ListTile(
            leading: time,
            title: Text(subject.name, style: TextStyle(fontSize: 21),),
            onTap: () => openCard(context),
          ),
        ),
      ),
    );
  }
}
