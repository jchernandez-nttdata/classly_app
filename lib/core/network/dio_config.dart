import 'package:classly_app/core/network/log_interceptor.dart';
import 'package:classly_app/core/services/environment_service.dart';
import 'package:classly_app/core/services/logger_service.dart';
import 'package:dio/dio.dart';

class DioConfig {
  DioConfig({
    required IEnvironmentService environmentService,
    required ILoggerService loggerService,
  }) : _environmentService = environmentService,
       _loggerService = loggerService;

  final IEnvironmentService _environmentService;
  final ILoggerService _loggerService;

  Dio build() {
    final dio = Dio(
      BaseOptions(
        baseUrl: _environmentService.apiBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
    dio.interceptors.add(DioLoggerInterceptor(_loggerService));
    return dio;
  }
}
