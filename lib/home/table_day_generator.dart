import 'package:flutter/material.dart';

import '../database/database.dart';
import '../model/subject_model.dart';
import '../widgets/subject_card.dart';
import '../model/days.dart';


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