part of 'students_cubit.dart';

class StudentsState extends Equatable {
  const StudentsState({
    this.requestStatus = RequestStatus.initial,
    this.students = const [],
    this.auxStudents = const [],
  });

  StudentsState copyWith({
    RequestStatus? requestStatus,
    List<Student>? students,
    List<Student>? auxStudents,
  }) {
    return StudentsState(
      requestStatus: requestStatus ?? this.requestStatus,
      students: students ?? this.students,
      auxStudents: auxStudents ?? this.auxStudents,
    );
  }

  final RequestStatus requestStatus;
  final List<Student> students;
  final List<Student> auxStudents;

  bool get isLoading => requestStatus == RequestStatus.loading;
  bool get isError => requestStatus == RequestStatus.failure;

  @override
  List<Object> get props => [requestStatus, students, auxStudents];
}
