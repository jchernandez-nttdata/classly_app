import 'package:classly_app/features/classes/domain/entities/class_schedule.dart';
import 'package:classly_app/features/classes/domain/entities/day_of_week.dart';

class ClassScheduleModel {
  ClassScheduleModel({
    required this.id,
    required this.dayOfWeek,
    required this.initTime,
    required this.endTime,
    required this.className,
    required this.location,
  });

  factory ClassScheduleModel.fromJson(Map<String, dynamic> json) =>
      ClassScheduleModel(
        id: json['id'] as int,
        dayOfWeek: json['dayOfWeek'] as int,
        initTime: json['startTime'] as String,
        endTime: json['endTime'] as String,
        className: json['className'] as String,
        location: json['locationName'] as String,
      );

  ClassSchedule toEntity() => ClassSchedule(
    id: id,
    dayOfWeek: DayOfWeek.fromValue(dayOfWeek),
    initTime: initTime,
    endTime: endTime,
    className: className,
    location: location,
  );

  final int id;
  final int dayOfWeek;
  final String initTime;
  final String endTime;
  final String className;
  final String location;
}
