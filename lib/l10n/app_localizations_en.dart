// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get logIn => 'Log in';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get invalidEmail => 'Email is invalid';

  @override
  String get passwordRequired => 'Password es required';

  @override
  String get operationFailed => 'Something went wrong. Please try again later.';

  @override
  String get students => 'Students';

  @override
  String get classes => 'Classes';

  @override
  String get chat => 'Chat';

  @override
  String get attendances => 'Attendances';

  @override
  String get payments => 'Payments';

  @override
  String get emptyStudents => 'No students';

  @override
  String get addStudent => 'Add student';

  @override
  String get editStudent => 'Edit student';

  @override
  String get name => 'Name';

  @override
  String get dni => 'DNI';

  @override
  String get phone => 'Phone';

  @override
  String get birthdate => 'Birthdate';

  @override
  String get save => 'Save';

  @override
  String get operationSuccess => 'Changes saved successfully';

  @override
  String get monday => 'Monday';

  @override
  String get tuesday => 'Tuesday';

  @override
  String get wednesday => 'Wednesday';

  @override
  String get thursday => 'Thursday';

  @override
  String get friday => 'Friday';

  @override
  String get saturday => 'Saturday';

  @override
  String get sunday => 'Sunday';

  @override
  String get emptyClasses => 'No classes';

  @override
  String get loading => 'Loading...';

  @override
  String get selectLocation => 'Select location';

  @override
  String get schedule => 'Schedule';

  @override
  String enrolledStudents(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count enrolled students',
      one: '1 enrolled student',
      zero: 'No enrolled students',
    );
    return '$_temp0';
  }

  @override
  String remainingClasses(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count remaining classes',
      one: '1 remaining class',
      zero: 'No remaining classes',
    );
    return '$_temp0';
  }
}
