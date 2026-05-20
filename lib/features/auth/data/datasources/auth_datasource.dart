import 'package:classly_app/features/auth/data/models/auth_response_model.dart';

abstract interface class IAuthDatasource {
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  });

  Future<void> logout();
}

enum AuthEndpoint {
  login('/auth/login')
  ;

  const AuthEndpoint(this.path);

  final String path;
}
