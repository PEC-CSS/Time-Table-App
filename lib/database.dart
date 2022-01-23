import 'timeTableElement.dart';
import 'days.dart';

class Database{
  static List<Data> get(Days day){
    List<Data> data = [];
    data.add(Data(subjectCode: "T01", subjectName: "Test01",
        startTime: DateTime(2022, 1, 21, 11, 50), duration: Duration(hours: 1)
    ));
    data.add(Data( subjectName: "Test02", subjectCode: "T02",
      startTime: DateTime(2022, 1, 21, 12, 50), duration: Duration(hours: 1)
    ));
    return data;
  }
}