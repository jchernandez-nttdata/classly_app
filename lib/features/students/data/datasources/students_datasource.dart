import 'package:classly_app/features/students/data/models/student_model.dart';
import 'package:classly_app/features/students/data/requests/add_student_request.dart';

abstract interface class IStudentsDatasource {
  Future<List<StudentModel>> getStudents();
  Future<void> addStudent(AddStudentRequest request);
}

enum StudentsEndpoint {
  getStudents('/users/students'),
  addStudent('/users')
  ;

  const StudentsEndpoint(this.path);

  final String path;
}
