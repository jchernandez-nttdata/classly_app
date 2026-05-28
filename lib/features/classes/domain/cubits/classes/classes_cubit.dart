import 'package:classly_app/core/models/request_status.dart';
import 'package:classly_app/core/models/result.dart';
import 'package:classly_app/features/classes/domain/entities/class_schedule.dart';
import 'package:classly_app/features/classes/domain/entities/location.dart';
import 'package:classly_app/features/classes/domain/repositories/classes_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'classes_state.dart';

class ClassesCubit extends Cubit<ClassesState> {
  ClassesCubit({
    required IClassesRepository repository,
  }) : _repository = repository,
       super(const ClassesState());

  final IClassesRepository _repository;

  Future<void> fetchLocations() async {
    emit(state.copyWith(locationsStatus: RequestStatus.loading));

    final result = await _repository.getLocations();

    switch (result) {
      case Success<List<Location>>():
        emit(
          state.copyWith(
            locationsStatus: RequestStatus.success,
            locations: result.value,
          ),
        );
      case Error<List<Location>>():
        emit(
          state.copyWith(
            locationsStatus: RequestStatus.failure,
          ),
        );
    }
  }

  Future<void> fetchClasses({int? locationId}) async {
    emit(state.copyWith(classesStatus: RequestStatus.loading));

    final result = await _repository.getClasses(locationId: locationId);

    switch (result) {
      case Success<List<ClassSchedule>>():
        emit(
          state.copyWith(
            classesStatus: RequestStatus.success,
            classes: result.value,
          ),
        );
      case Error<List<ClassSchedule>>():
        emit(
          state.copyWith(
            classesStatus: RequestStatus.failure,
          ),
        );
    }
  }
}
