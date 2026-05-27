import 'package:classly_app/core/models/request_status.dart';
import 'package:classly_app/core/models/result.dart';
import 'package:classly_app/features/students/data/requests/add_student_request.dart';
import 'package:classly_app/features/students/domain/cubits/manage_student/manage_student_form.dart';
import 'package:classly_app/features/students/domain/repositories/students_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'manage_student_state.dart';

class ManageStudentCubit extends Cubit<ManageStudentState> {
  ManageStudentCubit({required IStudentsRepository repository})
    : _repository = repository,
      super(const ManageStudentState());

  final IStudentsRepository _repository;

  Future<void> addStudent() async {
    emit(state.copyWith(requestStatus: RequestStatus.loading));

    final request = AddStudentRequest(
      name: state.studentFormData.name,
      email: state.studentFormData.email,
      dni: state.studentFormData.dni,
      password: state.studentFormData.password,
      phone: state.studentFormData.phone,
      birthDate: state.studentFormData.birthDate,
    );

    final result = await _repository.addStudent(request);

    switch (result) {
      case Success<void>():
        emit(state.copyWith(requestStatus: RequestStatus.success));
      case Error<void>():
        emit(state.copyWith(requestStatus: RequestStatus.failure));
    }
  }

  void updateForm(StudentFormData formData) {
    emit(state.copyWith(studentFormData: formData));
  }
}
