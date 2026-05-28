class Student {
  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.dni,
    required this.phone,
    required this.birthDate,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
    dni: json['dni'] as String,
    phone: json['phone'] as String,
    birthDate: DateTime.parse(json['birthDate'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'dni': dni,
    'phone': phone,
    'birthDate': birthDate.toIso8601String(),
  };

  final int id;
  final String name;
  final String email;
  final String dni;
  final String phone;
  final DateTime birthDate;
}
