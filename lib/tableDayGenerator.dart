import 'package:flutter/material.dart';

import 'database.dart';
import 'subject.dart';
import 'subjectCard.dart';
import 'days.dart';


class TableDayGenerate{
  static Widget generate(Days day){
    List<Subject> dayData = Database.get(day);

    List<SubjectCard> cards = [];
    for (Subject subject in dayData){
      cards.add(SubjectCard(subject: subject,));
    }

    ListView listOfCards = ListView(
      children: cards,
    );
    return listOfCards;
  }
}