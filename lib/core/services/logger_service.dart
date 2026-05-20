import 'package:logger/logger.dart';

abstract interface class ILoggerService {
  void debug(String message);

  void info(String message);

  void warning(String message);

  void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  });
}

class LoggerServiceImpl implements ILoggerService {
  LoggerServiceImpl()
    : _logger = Logger(
        printer: PrettyPrinter(
          methodCount: 0,
          errorMethodCount: 5,
          lineLength: 80,
          colors: false,
        ),
      );

  final Logger _logger;

  @override
  void debug(String message) {
    _logger.d(message);
  }

  @override
  void info(String message) {
    _logger.i(message);
  }

  @override
  void warning(String message) {
    _logger.w(message);
  }

  @override
  void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.e(
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
