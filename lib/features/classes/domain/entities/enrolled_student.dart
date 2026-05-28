class EnrolledStudent {
  EnrolledStudent({
    required this.userScheduleId,
    required this.name,
    required this.dni,
    required this.remainingClasses,
  });

  final int userScheduleId;
  final String name;
  final String dni;
  final int remainingClasses;
}
