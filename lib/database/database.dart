import '../model/subject_model.dart';
import '../model/days.dart';
import '../model/task_model.dart';
import 'package:flutter/material.dart';


class Database{
  static List<Subject> get(Days day){
    List<Subject> subjects = [];

    subjects.add(Subject(name: "Test01", color: Colors.blue,
      startTime: DateTime(2022, 1, 21, 11, 50), duration: Duration(hours: 1),
    ));

    subjects.add(Subject( name: "Test02", color: Colors.red,
      startTime: DateTime(2022, 1, 21, 12, 50), duration: Duration(hours: 1),
      description: "This is sample data about the subject.\nNew line",
    ));

    return subjects;
  }

  static List<Task> getTasks(){
    List<Task> tasks = [];

    tasks.add(Task(title: "Test work",  deadline: DateTime.now(), description: "This is sample data about the task.\nNew line", id: "10"));
    tasks.add(Task(title: "Test work2", deadline: DateTime(2023), id: "11"));


    return tasks;
  }
  static addNewTimeTable(List<List<Subject>> data) {

  }
}