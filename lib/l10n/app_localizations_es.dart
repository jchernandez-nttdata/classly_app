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
  String get operationFailed =>
      'Ocurrió un problema. Inténtalo nuevamente mas tarde.';

  @override
  String get students => 'Alumnos';

  @override
  String get classes => 'Clases';

  @override
  String get chat => 'Chat';

  @override
  String get attendances => 'Asistencias';

  @override
  String get payments => 'Pagos';

  @override
  String get emptyStudents => 'No hay estudiantes';

  @override
  String get addStudent => 'Agregar estudiante';

  @override
  String get editStudent => 'Editar estudiante';

  @override
  String get name => 'Nombre';

  @override
  String get dni => 'DNI';

  @override
  String get phone => 'Celular';

  @override
  String get birthdate => 'Fecha de nacimiento';

  @override
  String get save => 'Guardar';

  @override
  String get operationSuccess => 'Cambios guardados correctamente';

  @override
  String get monday => 'Lunes';

  @override
  String get tuesday => 'Martes';

  @override
  String get wednesday => 'Miércoles';

  @override
  String get thursday => 'Jueves';

  @override
  String get friday => 'Viernes';

  @override
  String get saturday => 'Sábado';

  @override
  String get sunday => 'Domingo';

  @override
  String get emptyClasses => 'No clases';
}
