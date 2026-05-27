class AddStudentRequest {
  const AddStudentRequest({
    required this.name,
    required this.email,
    required this.dni,
    required this.password,
    required this.phone,
    required this.birthDate,
  });

  const AddStudentRequest.empty()
    : name = '',
      email = '',
      dni = '',
      password = '',
      phone = '',
      birthDate = null;

  final String name;
  final String email;
  final String dni;
  final String password;
  final String phone;
  final DateTime? birthDate;

  AddStudentRequest copyWith({
    String? name,
    String? email,
    String? dni,
    String? password,
    String? phone,
    DateTime? birthDate,
  }) {
    return AddStudentRequest(
      name: name ?? this.name,
      email: email ?? this.email,
      dni: dni ?? this.dni,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      birthDate: birthDate ?? this.birthDate,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'dni': dni,
    'password': password,
    'phone': phone,
    'birthdate': birthDate?.toIso8601String(),
    'role': 'student',
  };
}
