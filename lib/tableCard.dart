import 'package:flutter/material.dart';
import 'dart:math';

import 'timeTableElement.dart';

class TableCard extends StatelessWidget {
  final Data data;
  final Widget time;

  TableCard({Key? key, required this.data}) :
        this.time = Text(
          "${data.startTime.hour} ${data.startTime.minute}",
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
          title: Text(data.subjectName, style: TextStyle(fontSize: 21),),
          subtitle: Text(data.subjectCode),
        ),
      ),
    );
  }
}
