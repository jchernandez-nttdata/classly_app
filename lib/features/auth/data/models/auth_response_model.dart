import 'package:classly_app/features/auth/domain/entities/auth_response.dart';

class AuthResponseModel {
  AuthResponseModel({
    required this.userId,
    required this.name,
    required this.email,
  });

  AuthResponseModel.fromJson(Map<String, dynamic> json)
    : userId = json['id'] as int,
      name = json['name'] as String,
      email = json['email'] as String;

  AuthResponse toEntity() {
    return AuthResponse(
      userId: userId,
      name: name,
      email: email,
    );
  }

  final int userId;
  final String name;
  final String email;
}
