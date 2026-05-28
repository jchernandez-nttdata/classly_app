import 'package:classly_app/core/utils/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
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

  static DayOfWeek fromValue(int value) {
    return switch (value) {
      1 => DayOfWeek.monday,
      2 => DayOfWeek.tuesday,
      3 => DayOfWeek.wednesday,
      4 => DayOfWeek.thursday,
      5 => DayOfWeek.friday,
      6 => DayOfWeek.saturday,
      7 => DayOfWeek.sunday,
      _ => throw Exception('Invalid day value: $value'),
    };
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
