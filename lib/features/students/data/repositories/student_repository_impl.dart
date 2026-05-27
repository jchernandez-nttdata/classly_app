import 'package:classly_app/core/models/result.dart';
import 'package:classly_app/features/students/data/datasources/students_datasource.dart';
import 'package:classly_app/features/students/data/requests/add_student_request.dart';
import 'package:classly_app/features/students/domain/entities/student.dart';
import 'package:classly_app/features/students/domain/repositories/students_repository.dart';

final class StudentsRepositoryImpl implements IStudentsRepository {
  StudentsRepositoryImpl({
    required IStudentsDatasource studentsDatasource,
  }) : _studentsDatasource = studentsDatasource;

  final IStudentsDatasource _studentsDatasource;

  @override
  Future<Result<List<Student>>> getStudents() async {
    try {
      final students = await _studentsDatasource.getStudents();
      return Success(students.map((student) => student.toEntity()).toList());
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> addStudent(AddStudentRequest request) async {
    try {
      await _studentsDatasource.addStudent(request);
      return const Success(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
