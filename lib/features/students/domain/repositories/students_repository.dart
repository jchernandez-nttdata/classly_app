import 'package:classly_app/core/models/result.dart';
import 'package:classly_app/features/students/data/requests/add_student_request.dart';
import 'package:classly_app/features/students/data/requests/update_student_request.dart';
import 'package:classly_app/features/students/domain/entities/student.dart';

abstract interface class IStudentsRepository {
  Future<Result<List<Student>>> getStudents();
  Future<Result<void>> addStudent(AddStudentRequest request);
  Future<Result<void>> updateStudent(UpdateStudentRequest request);
}
