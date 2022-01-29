import 'package:flutter/material.dart';

import 'day.dart';
import '../model/days.dart';
import '../widgets/tasks_button.dart';

class Home extends StatelessWidget {
  final String title;
  final List<Widget> tabs = <Widget>[
    Tab(text: "Monday",),
    Tab(text: "Tuesday",),
    Tab(text: "Wednesday",),
    Tab(text: "Thursday",),
    Tab(text: "Friday",),
    Tab(text: "Saturday",),
    Tab(text: "Sunday",)
  ];

  Home({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      initialIndex: DateTime.now().weekday - 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.title),
          bottom: TabBar(
            tabs: this.tabs,
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          children: [
            Day(day: Days.Monday),
            Day(day: Days.Tuesday),
            Day(day: Days.Wednesday),
            Day(day: Days.Thursday),
            Day(day: Days.Friday),
            Day(day: Days.Saturday),
            Day(day: Days.Sunday),
          ], //NOTE: The content for each day goes here
        ),
        floatingActionButton: TasksButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}
