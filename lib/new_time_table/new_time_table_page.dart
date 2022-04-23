import 'package:flutter/material.dart';
import 'package:time_table_app/model/days.dart';
import 'package:time_table_app/model/subject_model.dart';
import 'package:time_table_app/widgets/subject_card.dart';
import 'new_subject_card_page.dart';
import 'package:time_table_app/database/database.dart';

class NewTimeTablePage extends StatefulWidget {
  NewTimeTablePage({Key? key}) : super(key: key);

  @override
  State<NewTimeTablePage> createState() => _NewTimeTablePageState();
}

class _NewTimeTablePageState extends State<NewTimeTablePage> {
  final List<Widget> tabs = <Widget>[
    Tab(text: Days.Monday.name,),
    Tab(text: Days.Tuesday.name,),
    Tab(text: Days.Wednesday.name,),
    Tab(text: Days.Thursday.name,),
    Tab(text: Days.Friday.name,),
    Tab(text: Days.Saturday.name,),
    Tab(text: Days.Sunday.name,)
  ];

  Widget createCards(int index) {
    List<Widget> cards = [];
    for (Subject subject in data[index]) {
      cards.add(SubjectCard(subject: subject));
    }

    return ListView(children: cards,);
  }

  List<List<Subject>> data = List.generate(Days.values.length, (index) => []);

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
                      builder: (context) => NewSubject(day, data)
                    )).then((value){setState(() {});});
                  },
                  icon: Icon(Icons.add_sharp),
                ),
                TextButton(
                  onPressed: (){
                    Database.addNewTimeTable(data);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
            body: TabBarView(
              children: [
                createCards(0),
                createCards(1),
                createCards(2),
                createCards(3),
                createCards(4),
                createCards(5),
                createCards(6),
              ],
            ),
          );
        }
      ),
    );
  }
}
