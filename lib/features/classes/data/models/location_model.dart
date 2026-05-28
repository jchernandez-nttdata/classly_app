import 'package:classly_app/features/classes/domain/entities/location.dart';

class LocationModel {
  LocationModel({
    required this.id,
    required this.name,
  });

  LocationModel.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int,
      name = json['locationName'] as String;

  Location toEntity() => Location(
    id: id,
    name: name,
  );

  final int id;
  final String name;
}
