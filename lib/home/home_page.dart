import 'package:flutter/material.dart';

import 'day.dart';
import '../model/days.dart';
import '../widgets/tasks_button.dart';
import '../new_time_table/new_time_table_page.dart';

class Home extends StatelessWidget {
  final String title;
  final List<Widget> tabs = <Widget>[
    Tab(text: Days.Monday.name,),
    Tab(text: Days.Tuesday.name,),
    Tab(text: Days.Wednesday.name,),
    Tab(text: Days.Thursday.name,),
    Tab(text: Days.Friday.name,),
    Tab(text: Days.Saturday.name,),
    Tab(text: Days.Sunday.name,)
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
        drawer: HomeDrawer(),
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

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text("Welcome back user"),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: const Text(
              "Create a new timetable",
              style: TextStyle(
                fontSize: 18.0
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => NewTimeTablePage()
              ));
            },
          )
        ],
      ),
    );
  }
}
