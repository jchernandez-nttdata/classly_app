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

  final int id;
  final DayOfWeek dayOfWeek;
  final String initTime;
  final String endTime;
  final String className;
  final String location;
}
