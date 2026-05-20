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
  String operationFailed(Object operation) {
    return 'Something went wrong while trying to $operation. Please try again.';
  }
}
