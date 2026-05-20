import 'package:classly_app/features/students/domain/entities/student.dart';

class StudentModel {
  StudentModel({
    required this.id,
    required this.name,
    required this.email,
    required this.dni,
    required this.phone,
    required this.birthDate,
  });

  StudentModel.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int,
      name = json['name'] as String,
      email = json['email'] as String,
      dni = json['dni'] as String,
      phone = json['phone'] as String,
      birthDate = DateTime.parse(json['birthdate'] as String);

  Student toEntity() => Student(
    id: id,
    name: name,
    email: email,
    dni: dni,
    phone: phone,
    birthDate: birthDate,
  );

  final int id;
  final String name;
  final String email;
  final String dni;
  final String phone;
  final DateTime birthDate;
}
