import 'package:classly_app/core/models/result.dart';
import 'package:classly_app/features/classes/data/datasources/classes_datasource.dart';
import 'package:classly_app/features/classes/domain/entities/class_schedule.dart';
import 'package:classly_app/features/classes/domain/entities/location.dart';
import 'package:classly_app/features/classes/domain/repositories/classes_repository.dart';

final class ClassesRepositoryImpl implements IClassesRepository {
  ClassesRepositoryImpl({
    required IClassesDatasource classesDatasource,
  }) : _classesDatasource = classesDatasource;

  final IClassesDatasource _classesDatasource;

  @override
  Future<Result<List<Location>>> getLocations() async {
    try {
      final locations = await _classesDatasource.getLocations();
      return Success(locations.map((location) => location.toEntity()).toList());
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<ClassSchedule>>> getClasses({int? locationId}) async {
    try {
      final classes = await _classesDatasource.getClasses(
        locationId: locationId,
      );
      return Success(
        classes.map((classSchedule) => classSchedule.toEntity()).toList(),
      );
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
