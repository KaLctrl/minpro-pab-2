class Activity {
  final String id;
  final String name;
  final int duration;
  final String date;
  final String notes;

  Activity({
    required this.id,
    required this.name,
    required this.duration,
    required this.date,
    required this.notes,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'],
      name: json['name'],
      duration: json['duration'],
      date: json['date'],
      notes: json['notes'] ?? '',
    );
  }
}