import 'dart:async';

import 'package:classly_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;

  void showLoader() {
    if (!mounted) return;

    unawaited(
      showDialog<void>(
        context: this,
        barrierDismissible: false,
        builder: (_) {
          return const PopScope(
            canPop: false,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  void hideLoader() {
    if (!mounted) return;

    final navigator = Navigator.of(this, rootNavigator: true);

    if (navigator.canPop()) {
      navigator.pop();
    }
  }
}
