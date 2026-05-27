import 'package:equatable/equatable.dart';

class StudentFormData extends Equatable {
  const StudentFormData({
    this.name = '',
    this.email = '',
    this.dni = '',
    this.password = '',
    this.phone = '',
    this.birthDate,
  });

  final String name;
  final String email;
  final String dni;
  final String password;
  final String phone;
  final DateTime? birthDate;

  StudentFormData copyWith({
    String? name,
    String? email,
    String? dni,
    String? password,
    String? phone,
    DateTime? birthDate,
  }) {
    return StudentFormData(
      name: name ?? this.name,
      email: email ?? this.email,
      dni: dni ?? this.dni,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      birthDate: birthDate ?? this.birthDate,
    );
  }

  @override
  List<Object?> get props => [
    name,
    email,
    dni,
    password,
    phone,
    birthDate,
  ];
}
