import 'package:classly_app/core/models/result.dart';
import 'package:classly_app/features/classes/domain/entities/class_schedule.dart';
import 'package:classly_app/features/classes/domain/entities/location.dart';

abstract interface class IClassesRepository {
  Future<Result<List<Location>>> getLocations();
  Future<Result<List<ClassSchedule>>> getClasses({int? locationId});
}
