import 'package:flutter/material.dart';

import '../model/subject_model.dart';
import 'popup_subject_card.dart';
import '../home/hero_dialog_route.dart';

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
    Navigator.push(context, HeroDialogRoute(builder: (context) => PopupSubjectCard(subject: this.subject)));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: this.subject.code,
        child: Card(
          color: Colors.red,
          margin: EdgeInsets.zero,
          shape: Border(),
          child:  ListTile(
            leading: time,
            title: Text(subject.name, style: TextStyle(fontSize: 21),),
            subtitle: Text(subject.code),
            onTap: () => openCard(context),
          ),
        ),
      ),
    );
  }
}