import 'package:classly_app/core/models/request_status.dart';
import 'package:classly_app/core/models/result.dart';
import 'package:classly_app/features/students/domain/entities/student.dart';
import 'package:classly_app/features/students/domain/repositories/students_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'students_state.dart';

class StudentsCubit extends Cubit<StudentsState> {
  StudentsCubit({required IStudentsRepository repository})
    : _repository = repository,
      super(const StudentsState());

  final IStudentsRepository _repository;

  Future<void> fetchStudents() async {
    emit(state.copyWith(requestStatus: RequestStatus.loading));

    final result = await _repository.getStudents();

    switch (result) {
      case Success<List<Student>>():
        emit(
          state.copyWith(
            requestStatus: RequestStatus.success,
            students: result.value,
            auxStudents: result.value,
          ),
        );
      case Error<List<Student>>():
        emit(
          state.copyWith(
            requestStatus: RequestStatus.failure,
          ),
        );
    }
  }

  void filterStudents(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(students: state.auxStudents));
      return;
    }
    final filteredStudents = state.auxStudents
        .where(
          (student) =>
              student.name.toLowerCase().contains(query.toLowerCase()) ||
              student.email.toLowerCase().contains(query.toLowerCase()) ||
              student.dni.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    emit(state.copyWith(students: filteredStudents));
  }
}
