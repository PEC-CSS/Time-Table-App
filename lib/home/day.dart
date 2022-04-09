import 'package:flutter/material.dart';

import '../database/database.dart';
import '../model/subject_model.dart';
import '../widgets/subject_card.dart';
import '../model/days.dart';

class Day extends StatelessWidget {
  const Day({Key? key, required this.day}) : super(key: key);

  final Days day;

  List<Widget> createCards(){
    List<Subject> subjects = Database.get(this.day);
    List<SubjectCard> cards = [];
    for (Subject subject in subjects){
      cards.add(SubjectCard(subject: subject));
    }
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: createCards(),
    );
  }
}
