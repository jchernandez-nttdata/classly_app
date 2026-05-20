import 'package:classly_app/core/network/http_client.dart';
import 'package:classly_app/core/network/http_request.dart';
import 'package:classly_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:classly_app/features/auth/data/models/auth_response_model.dart';

final class AuthDatasourceImpl implements IAuthDatasource {
  AuthDatasourceImpl({
    required IHttpClient httpClient,
  }) : _httpClient = httpClient;

  final IHttpClient _httpClient;

  @override
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _httpClient.request(
      HttpRequest(
        path: AuthEndpoint.login.path,
        method: HttpMethod.post,
        data: {
          'email': email,
          'password': password,
        },
      ),
    );

    return AuthResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }
}
