import 'package:classly_app/features/classes/data/models/class_schedule_model.dart';
import 'package:classly_app/features/classes/data/models/location_model.dart';

abstract interface class IClassesDatasource {
  Future<List<LocationModel>> getLocations();
  Future<List<ClassScheduleModel>> getClasses({int? locationId});
}

enum ClassesEndpoint {
  getClasses('/schedules'),
  locations('/locations')
  ;

  const ClassesEndpoint(this.path);

  final String path;
}
