import 'package:classly_app/core/network/http_client.dart';
import 'package:classly_app/core/network/http_request.dart';
import 'package:classly_app/features/students/data/datasources/students_datasource.dart';
import 'package:classly_app/features/students/data/models/student_model.dart';

final class StudentsDatasourceImpl implements IStudentsDatasource {
  StudentsDatasourceImpl({
    required IHttpClient httpClient,
  }) : _httpClient = httpClient;

  final IHttpClient _httpClient;

  @override
  Future<List<StudentModel>> getStudents() async {
    final response = await _httpClient.request(
      HttpRequest(
        path: StudentsEndpoint.getStudents.path,
        method: HttpMethod.get,
      ),
    );

    final data = response.data as List<dynamic>;
    return data
        .map((json) => StudentModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
