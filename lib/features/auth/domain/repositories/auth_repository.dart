import 'package:classly_app/core/models/result.dart';
import 'package:classly_app/features/auth/domain/entities/auth_response.dart';

abstract interface class IAuthRepository {
  Future<Result<AuthResponse>> login({
    required String email,
    required String password,
  });

  Future<Result<void>> logout();
}
