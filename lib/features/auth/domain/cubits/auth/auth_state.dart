part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.requestStatus = RequestStatus.initial,
    this.authResponse,
    this.email = '',
    this.password = '',
  });

  AuthState copyWith({
    RequestStatus? requestStatus,
    AuthResponse? authResponse,
    String? email,
    String? password,
  }) => AuthState(
    requestStatus: requestStatus ?? this.requestStatus,
    authResponse: authResponse ?? this.authResponse,
    email: email ?? this.email,
    password: password ?? this.password,
  );

  final String email;
  final String password;
  final RequestStatus requestStatus;
  final AuthResponse? authResponse;

  bool get isFormValid => email.isNotEmpty && password.isNotEmpty;
  bool get isLoading => requestStatus == RequestStatus.loading;
  bool get isError => requestStatus == RequestStatus.failure;
  bool get isSuccess => requestStatus == RequestStatus.success;

  @override
  List<Object?> get props => [requestStatus, authResponse, email, password];
}
