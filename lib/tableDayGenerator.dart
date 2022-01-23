import 'package:flutter/material.dart';

import 'database.dart';
import 'timeTableElement.dart';
import 'tableCard.dart';
import 'days.dart';



class TableDayGenerate{
  static Widget generate(Days day){
    List<Data> dayData = Database.get(day);

    List<TableCard> cards = [];
    for (Data data in dayData){
      cards.add(TableCard(data: data,));
    }

    ListView listOfCards = ListView(
      children: cards,
    );
    return listOfCards;
  }
}