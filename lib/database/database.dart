import '../model/subject_model.dart';
import '../model/days.dart';
import '../model/task_model.dart';
import 'package:flutter/material.dart';


class Database{
  static Future<List<Subject>> get(Days day) async{
    List<Subject> subjects = [];
    subjects.add(Subject(name: "Test01", color: Colors.blue,
      startTime: DateTime(2022, 1, 21, 11, 50), duration: Duration(hours: 1),
    ));

    subjects.add(Subject( name: "Test02", color: Colors.red,
      startTime: DateTime(2022, 1, 21, 12, 50), duration: Duration(hours: 1),
      description: "This is sample data about the subject.\nNew line",
    ));

    //NOTE: This is an artificial delay meant only to simulate fetching from
    // the database, remove after db integration
    await Future.delayed(Duration(seconds: 2));

    return subjects;
  }

  static Future<List<Task>> getTasks() async{
    List<Task> tasks = [];

    //NOTE: This is an artificial delay meant only to simulate fetching from
    // the database, remove after db integration
    await Future.delayed(Duration(seconds: 2));

    tasks.add(Task(title: "Test work",  deadline: DateTime.now(),
        description: "This is sample data about the task.\nNew line", id: "10"));
    tasks.add(Task(title: "Test work2", deadline: DateTime(2023), id: "11"));

    return tasks;
  }
  static void addNewTimeTable(List<List<Subject>> data) async {
    //NOTE: This is an artificial delay meant only to simulate fetching from
    // the database, remove after db integration
    await Future.delayed(Duration(seconds: 2));
  }
}