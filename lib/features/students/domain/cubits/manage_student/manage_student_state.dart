part of 'manage_student_cubit.dart';

class ManageStudentState extends Equatable {
  const ManageStudentState({
    this.requestStatus = RequestStatus.initial,
    this.studentFormData = const StudentFormData(),
    this.studentId,
  });

  final RequestStatus requestStatus;
  final StudentFormData studentFormData;
  final int? studentId;

  bool get isError => requestStatus == RequestStatus.failure;
  bool get isSuccess => requestStatus == RequestStatus.success;

  ManageStudentState copyWith({
    RequestStatus? requestStatus,
    StudentFormData? studentFormData,
    int? studentId,
  }) {
    return ManageStudentState(
      requestStatus: requestStatus ?? this.requestStatus,
      studentFormData: studentFormData ?? this.studentFormData,
      studentId: studentId ?? this.studentId,
    );
  }

  @override
  List<Object?> get props => [
    requestStatus,
    studentFormData,
    studentId,
  ];
}
