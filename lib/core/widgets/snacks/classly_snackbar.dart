import 'package:flutter/material.dart';

enum ClasslySnackbarType {
  success,
  error,
  info,
}

final class ClasslySnackbar {
  const ClasslySnackbar._();

  static void show(
    BuildContext context, {
    required String message,
    required ClasslySnackbarType type,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Row(
            children: [
              Icon(
                _getIcon(type),
                color: Colors.white,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(message),
              ),
            ],
          ),
          backgroundColor: _getBackgroundColor(type),
        ),
      );
  }

  static IconData _getIcon(ClasslySnackbarType type) {
    switch (type) {
      case ClasslySnackbarType.success:
        return Icons.check_circle_outline;

      case ClasslySnackbarType.error:
        return Icons.error_outline;

      case ClasslySnackbarType.info:
        return Icons.info_outline;
    }
  }

  static Color _getBackgroundColor(ClasslySnackbarType type) {
    switch (type) {
      case ClasslySnackbarType.success:
        return Colors.green;

      case ClasslySnackbarType.error:
        return Colors.red;

      case ClasslySnackbarType.info:
        return Colors.blue;
    }
  }
}
