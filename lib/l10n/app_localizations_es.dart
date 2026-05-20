// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get helloWorld => 'Hola Mundo!';

  @override
  String get email => 'Correo';

  @override
  String get password => 'Contraseña';

  @override
  String get logIn => 'Iniciar sesión';

  @override
  String get emailRequired => 'Correo es requerido';

  @override
  String get invalidEmail => 'Correo es inválido';

  @override
  String get passwordRequired => 'Contraseña es requerida';

  @override
  String operationFailed(Object operation) {
    return 'Ocurrió un problema al intentar $operation. Inténtalo nuevamente.';
  }
}
