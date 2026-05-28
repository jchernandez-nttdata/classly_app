class UpdateStudentRequest {
  const UpdateStudentRequest({
    required this.id,
    required this.name,
    required this.email,
    required this.dni,
    required this.phone,
    required this.birthDate,
  });

  final int id;
  final String name;
  final String email;
  final String dni;
  final String phone;
  final DateTime? birthDate;

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'dni': dni,
    'phone': phone,
    'birthdate': birthDate?.toIso8601String(),
  };
}
