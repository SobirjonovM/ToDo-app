class Task {
  String name;
  DateTime dateTime;
  String description;
  bool isCompleted;

  Task(this.name, this.dateTime, this.description, {this.isCompleted = false});

  String get time => '${dateTime.hour}:${dateTime.minute}';
  String get date => '${dateTime.day}/${dateTime.month}/${dateTime.year}';
}
