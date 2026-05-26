import 'package:classly_app/core/widgets/navigation_shell/shell_config.dart';
import 'package:classly_app/features/students/presentation/pages/students_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShellPageConfigResolver {
  static ShellPageConfig resolve(
    BuildContext context,
  ) {
    final exactLocation = GoRouterState.of(context).uri.toString();
    switch (exactLocation) {
      case '/students':
        return StudentsView.config(context);

      default:
        return const ShellPageConfig();
    }
  }
}
