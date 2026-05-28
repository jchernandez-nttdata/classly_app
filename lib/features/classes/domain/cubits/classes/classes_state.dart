part of 'classes_cubit.dart';

class ClassesState extends Equatable {
  const ClassesState({
    this.locationsStatus = RequestStatus.initial,
    this.locations = const [],
    this.classesStatus = RequestStatus.initial,
    this.classes = const [],
  });

  final RequestStatus locationsStatus;
  final List<Location> locations;
  final RequestStatus classesStatus;
  final List<ClassSchedule> classes;

  bool get isLocationsLoading => locationsStatus == RequestStatus.loading;
  bool get isClassesLoading => classesStatus == RequestStatus.loading;
  bool get hasLocationsError => locationsStatus == RequestStatus.failure;
  bool get hasClassesError => classesStatus == RequestStatus.failure;

  ClassesState copyWith({
    RequestStatus? locationsStatus,
    List<Location>? locations,
    RequestStatus? classesStatus,
    List<ClassSchedule>? classes,
  }) => ClassesState(
    locationsStatus: locationsStatus ?? this.locationsStatus,
    locations: locations ?? this.locations,
    classesStatus: classesStatus ?? this.classesStatus,
    classes: classes ?? this.classes,
  );

  @override
  List<Object> get props => [
    locationsStatus,
    locations,
    classesStatus,
    classes,
  ];
}
