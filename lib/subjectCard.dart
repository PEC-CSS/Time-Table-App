import 'package:flutter/material.dart';
import 'dart:math';

import 'subject.dart';

class SubjectCard extends StatelessWidget {
  final Subject subject;
  final Widget time;

  SubjectCard({Key? key, required this.subject}) :
        this.time = Text(
          "${subject.startTime.hour} ${subject.startTime.minute}",
          style: TextStyle(fontSize: 20),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        margin: EdgeInsets.zero,
        shape: Border(),
        child:  ListTile(
          leading: time,
          title: Text(subject.name, style: TextStyle(fontSize: 21),),
          subtitle: Text(subject.code),
        ),
      ),
    );
  }
}
