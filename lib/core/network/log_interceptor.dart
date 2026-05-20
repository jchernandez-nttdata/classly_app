import 'package:classly_app/core/services/logger_service.dart';
import 'package:dio/dio.dart';

class DioLoggerInterceptor extends Interceptor {
  DioLoggerInterceptor(this._logger);

  final ILoggerService _logger;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    _logger.info(
      '''
➡️ REQUEST
${options.method} ${options.uri}

Headers:
${options.headers}

Query:
${options.queryParameters}

Body:
${options.data}
''',
    );

    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    /// we ignore the inference failure here because Dio's Response type is not
    /// generic, but we want to log the data regardless of its type
    // ignore: strict_raw_type
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    _logger.info(
      '''
✅ RESPONSE
${response.requestOptions.method} ${response.requestOptions.uri}

Status:
${response.statusCode}

Data:
${response.data}
''',
    );

    super.onResponse(response, handler);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    _logger.error(
      '''
❌ ERROR
${err.requestOptions.method} ${err.requestOptions.uri}

Status:
${err.response?.statusCode}

Message:
${err.message}

Data:
${err.response?.data}
''',
      error: err,
      stackTrace: err.stackTrace,
    );

    super.onError(err, handler);
  }
}
