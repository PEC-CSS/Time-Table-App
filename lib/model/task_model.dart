class Task{
  String title;
  String description;
  DateTime deadline;
  String id;
  Task({
    required this.title,
    required this.deadline,
    this.description = "",
    required this.id}
    );
}