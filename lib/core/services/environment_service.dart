import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract interface class IEnvironmentService {
  String get apiBaseUrl;
}

class EnvironmentService implements IEnvironmentService {
  @override
  String get apiBaseUrl => dotenv.get('API_URL');
}
