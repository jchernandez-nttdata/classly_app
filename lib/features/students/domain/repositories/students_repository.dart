import 'package:classly_app/core/models/result.dart';
import 'package:classly_app/features/students/domain/entities/student.dart';

abstract interface class IStudentsRepository {
  Future<Result<List<Student>>> getStudents();
}
