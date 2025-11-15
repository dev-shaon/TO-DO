class TaskModel {
  int? id;
  String title;
  String category;
  DateTime date;
  String time;
  String notes;
  int isCompleted;

  TaskModel({
    this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.time,
    required this.notes,
    this.isCompleted = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "category": category,
      "date": date.toIso8601String(),
      "time": time,
      "notes": notes,
      "isCompleted": isCompleted,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map["id"],
      title: map["title"],
      category: map["category"],
      date: DateTime.parse(map["date"]),
      time: map["time"],
      notes: map["notes"],
      isCompleted: map["isCompleted"] ?? 0,
    );
  }
}
