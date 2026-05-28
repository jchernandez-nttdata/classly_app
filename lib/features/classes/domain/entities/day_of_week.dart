import 'package:classly_app/core/utils/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

enum DayOfWeek {
  monday(1),
  tuesday(2),
  wednesday(3),
  thursday(4),
  friday(5),
  saturday(6),
  sunday(7)
  ;

  const DayOfWeek(this.value);

  final int value;

  static DayOfWeek fromValue(int value) {
    return DayOfWeek.values.firstWhere(
      (day) => day.value == value,
      orElse: () => throw Exception('Invalid day value: $value'),
    );
  }
}

extension DayOfWeekMapper on DayOfWeek {
  int get value {
    switch (this) {
      case DayOfWeek.monday:
        return 1;
      case DayOfWeek.tuesday:
        return 2;
      case DayOfWeek.wednesday:
        return 3;
      case DayOfWeek.thursday:
        return 4;
      case DayOfWeek.friday:
        return 5;
      case DayOfWeek.saturday:
        return 6;
      case DayOfWeek.sunday:
        return 7;
    }
  }

  String localized(BuildContext context) {
    switch (this) {
      case DayOfWeek.monday:
        return context.localizations.monday;
      case DayOfWeek.tuesday:
        return context.localizations.tuesday;
      case DayOfWeek.wednesday:
        return context.localizations.wednesday;
      case DayOfWeek.thursday:
        return context.localizations.thursday;
      case DayOfWeek.friday:
        return context.localizations.friday;
      case DayOfWeek.saturday:
        return context.localizations.saturday;
      case DayOfWeek.sunday:
        return context.localizations.sunday;
    }
  }
}
