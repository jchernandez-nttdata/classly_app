import 'package:classly_app/core/models/result.dart';
import 'package:classly_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:classly_app/features/auth/domain/entities/auth_response.dart';
import 'package:classly_app/features/auth/domain/repositories/auth_repository.dart';

final class AuthRepositoryImpl implements IAuthRepository {
  AuthRepositoryImpl({
    required IAuthDatasource authDatasource,
  }) : _authDatasource = authDatasource;

  final IAuthDatasource _authDatasource;

  @override
  Future<Result<AuthResponse>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authDatasource.login(
        email: email,
        password: password,
      );

      return Success(
        response.toEntity(),
      );
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> logout() async {
    return Result.success(null);
  }
}
