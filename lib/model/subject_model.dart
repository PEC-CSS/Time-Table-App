import 'task_model.dart';

class Subject{
  String name;
  String code;
  DateTime startTime;
  Duration duration;

  List<Task> tasks;

  Subject({required this.name, required this.code,
    required this.startTime, required this.duration, required this.tasks});
}