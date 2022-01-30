import '../model/subject_model.dart';
import '../model/days.dart';
import '../model/task_model.dart';


class Database{
  static List<Subject> get(Days day){
    List<Task> dummyTasks = [];
    List<Subject> subjects = [];

    subjects.add(Subject(code: "T01", name: "Test01",
      startTime: DateTime(2022, 1, 21, 11, 50), duration: Duration(hours: 1), tasks: dummyTasks
    ));

    dummyTasks.add(Task(title: "Test work",  deadline: DateTime.now(), description: "Hello", id: "10"));
    dummyTasks.add(Task(title: "TestWork2", deadline: DateTime(2023), id: "11"));
    subjects.add(Subject( name: "Test02", code: "T02",
      startTime: DateTime(2022, 1, 21, 12, 50), duration: Duration(hours: 1), tasks: dummyTasks
    ));

    return subjects;
  }

  static List<Task> getTasks(){
    List<Task> tasks = [];

    tasks.add(Task(title: "Test work",  deadline: DateTime.now(), description: "This is sample data about the task.\nNew line", id: "10"));
    tasks.add(Task(title: "Test work2", deadline: DateTime(2023), id: "11"));


    return tasks;
  }
}