import 'package:classly_app/features/students/data/models/student_model.dart';

abstract interface class IStudentsDatasource {
  Future<List<StudentModel>> getStudents();
}

enum StudentsEndpoint {
  getStudents('/users/students')
  ;

  const StudentsEndpoint(this.path);

  final String path;
}
