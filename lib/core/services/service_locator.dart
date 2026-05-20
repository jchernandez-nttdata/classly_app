import 'package:classly_app/core/network/dio_config.dart';
import 'package:classly_app/core/network/dio_http_client.dart';
import 'package:classly_app/core/network/http_client.dart';
import 'package:classly_app/core/services/environment_service.dart';
import 'package:classly_app/core/services/logger_service.dart';
import 'package:classly_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:classly_app/features/auth/data/datasources/auth_datasource_impl.dart';
import 'package:classly_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:classly_app/features/auth/domain/cubits/auth/auth_cubit.dart';
import 'package:classly_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt
    ..registerLazySingleton<IEnvironmentService>(EnvironmentService.new)
    ..registerLazySingleton<ILoggerService>(LoggerServiceImpl.new)
    ..registerLazySingleton<IHttpClient>(
      () => DioHttpClient(
        DioConfig(
          environmentService: getIt<IEnvironmentService>(),
          loggerService: getIt<ILoggerService>(),
        ).build(),
      ),
    )
    // AUTH MODULE
    ..registerLazySingleton<IAuthDatasource>(
      () => AuthDatasourceImpl(httpClient: getIt<IHttpClient>()),
    )
    ..registerLazySingleton<IAuthRepository>(
      () => AuthRepositoryImpl(authDatasource: getIt<IAuthDatasource>()),
    )
    ..registerFactory<AuthCubit>(
      () => AuthCubit(repository: getIt<IAuthRepository>()),
    );
}
