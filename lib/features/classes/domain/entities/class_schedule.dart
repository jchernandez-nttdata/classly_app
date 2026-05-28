import 'package:classly_app/features/classes/domain/entities/day_of_week.dart';

class ClassSchedule {
  ClassSchedule({
    required this.id,
    required this.dayOfWeek,
    required this.endTime,
    required this.initTime,
    required this.location,
    required this.className,
  });

  // fromjson
  factory ClassSchedule.fromJson(Map<String, dynamic> json) => ClassSchedule(
    id: json['id'] as int,
    dayOfWeek: DayOfWeek.fromValue(json['dayOfWeek'] as int),
    initTime: json['initTime'] as String,
    endTime: json['endTime'] as String,
    className: json['className'] as String,
    location: json['location'] as String,
  );

  // tojson
  Map<String, dynamic> toJson() => {
    'id': id,
    'dayOfWeek': dayOfWeek.value,
    'initTime': initTime,
    'endTime': endTime,
    'className': className,
    'location': location,
  };

  final int id;
  final DayOfWeek dayOfWeek;
  final String initTime;
  final String endTime;
  final String className;
  final String location;
}
