import 'package:flutter/material.dart';

import '../database/database.dart';
import '../model/subject_model.dart';
import '../widgets/subject_card.dart';
import '../model/days.dart';

class Day extends StatefulWidget {
  const Day({Key? key, required this.day}) : super(key: key);

  final Days day;

  @override
  State<Day> createState() => _DayState();
}

class _DayState extends State<Day> {
  List<SubjectCard> cards = [];
  bool loading = true;
  void createCards() async{
    List<Subject> subjects = await Database.get(this.widget.day);
    for (Subject subject in subjects){
      cards.add(SubjectCard(subject: subject));
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    createCards();
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Center(child: CircularProgressIndicator()) : ListView(
      children: cards,
    );
  }
}
