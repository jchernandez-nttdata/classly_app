import 'package:classly_app/core/network/http_client.dart';
import 'package:classly_app/core/network/http_request.dart';
import 'package:classly_app/features/classes/data/datasources/classes_datasource.dart';
import 'package:classly_app/features/classes/data/models/class_schedule_model.dart';
import 'package:classly_app/features/classes/data/models/location_model.dart';

final class ClassesDatasourceImpl implements IClassesDatasource {
  ClassesDatasourceImpl({
    required IHttpClient httpClient,
  }) : _httpClient = httpClient;

  final IHttpClient _httpClient;

  @override
  Future<List<LocationModel>> getLocations() async {
    final response = await _httpClient.request(
      HttpRequest(
        path: ClassesEndpoint.locations.path,
        method: HttpMethod.get,
      ),
    );

    final data = response.data as List<dynamic>;
    return data
        .map((json) => LocationModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<ClassScheduleModel>> getClasses({int? locationId}) async {
    final response = await _httpClient.request(
      HttpRequest(
        path: ClassesEndpoint.getClasses.path,
        method: HttpMethod.get,
        queryParameters: locationId != null ? {'locationId': locationId} : null,
      ),
    );

    final data = response.data as List<dynamic>;
    return data
        .map(
          (json) => ClassScheduleModel.fromJson(json as Map<String, dynamic>),
        )
        .toList();
  }
}
