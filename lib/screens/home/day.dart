import 'package:flutter/material.dart';

import 'package:time_table_app/database/database.dart';
import 'package:time_table_app/model/subject_model.dart';
import 'package:time_table_app/widgets/subject_card.dart';
import 'package:time_table_app/model/days.dart';

class Day extends StatefulWidget {
  const Day({Key? key, required this.day}) : super(key: key);

  final Days day;

  @override
  State<Day> createState() => _DayState();
}

class _DayState extends State<Day> {
  List<SubjectCard> cards = [];
  bool loading = true;
  void createCards() async {
    List<Subject> subjects = await Database.get(widget.day);
    for (Subject subject in subjects) {
      cards.add(SubjectCard(subject: subject));
    }
    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    createCards();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(child: CircularProgressIndicator())
        : ListView(
            children: cards,
          );
  }
}
