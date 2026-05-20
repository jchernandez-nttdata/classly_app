import 'package:classly_app/core/models/request_status.dart';
import 'package:classly_app/core/models/result.dart';
import 'package:classly_app/features/auth/domain/entities/auth_response.dart';
import 'package:classly_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required IAuthRepository repository,
  }) : _repository = repository,
       super(const AuthState());

  final IAuthRepository _repository;

  void emailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  Future<void> login() async {
    emit(state.copyWith(requestStatus: RequestStatus.loading));

    final result = await _repository.login(
      email: state.email,
      password: state.password,
    );

    switch (result) {
      case Success<AuthResponse>():
        emit(
          state.copyWith(
            requestStatus: RequestStatus.success,
            authResponse: result.value,
          ),
        );
      case Error<AuthResponse>():
        emit(
          state.copyWith(
            requestStatus: RequestStatus.failure,
          ),
        );
    }
  }
}
