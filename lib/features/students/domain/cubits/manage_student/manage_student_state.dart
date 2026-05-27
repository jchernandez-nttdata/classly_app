part of 'manage_student_cubit.dart';

class ManageStudentState extends Equatable {
  const ManageStudentState({
    this.requestStatus = RequestStatus.initial,
    this.studentFormData = const StudentFormData(),
  });

  final RequestStatus requestStatus;
  final StudentFormData studentFormData;

  bool get isError => requestStatus == RequestStatus.failure;
  bool get isSuccess => requestStatus == RequestStatus.success;

  ManageStudentState copyWith({
    RequestStatus? requestStatus,
    StudentFormData? studentFormData,
  }) {
    return ManageStudentState(
      requestStatus: requestStatus ?? this.requestStatus,
      studentFormData: studentFormData ?? this.studentFormData,
    );
  }

  @override
  List<Object?> get props => [
    requestStatus,
    studentFormData,
  ];
}
