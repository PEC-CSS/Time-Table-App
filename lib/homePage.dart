import 'package:flutter/material.dart';


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
            Text("Page for Monday"),
            Text("Page for Tuesday"),
            Text("Page for Wednesday"),
            Text("Page for Thursday"),
            Text("Page for Friday"),
            Text("Page for Saturday"),
            Text("Page for Sunday"),
          ], //NOTE: The content for each day goes here
        ),
      ),
    );
  }
}
