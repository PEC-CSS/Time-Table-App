import 'subject.dart';
import 'days.dart';

class Database{
  static List<Subject> get(Days day){
    List<Subject> subjects = [];
    subjects.add(Subject(code: "T01", name: "Test01",
        startTime: DateTime(2022, 1, 21, 11, 50), duration: Duration(hours: 1)
    ));
    subjects.add(Subject( name: "Test02", code: "T02",
      startTime: DateTime(2022, 1, 21, 12, 50), duration: Duration(hours: 1)
    ));
    return subjects;
  }
}