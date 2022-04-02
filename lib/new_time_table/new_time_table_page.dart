import 'package:flutter/material.dart';
import 'package:time_table_app/model/days.dart';
import 'new_subject_card.dart';

class NewTimeTablePage extends StatelessWidget {
  NewTimeTablePage({Key? key}) : super(key: key);

  final List<Widget> tabs = <Widget>[
    Tab(text: Days.Monday.name,),
    Tab(text: Days.Tuesday.name,),
    Tab(text: Days.Wednesday.name,),
    Tab(text: Days.Thursday.name,),
    Tab(text: Days.Friday.name,),
    Tab(text: Days.Saturday.name,),
    Tab(text: Days.Sunday.name,)
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      initialIndex: 0,
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Create a new timetable"),
              bottom: TabBar(
                tabs: this.tabs,
                isScrollable: true,
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    int day = DefaultTabController.of(context)?.index ?? 0;
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => NewSubject(day)
                    ));
                  },
                  icon: Icon(Icons.add_sharp),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
