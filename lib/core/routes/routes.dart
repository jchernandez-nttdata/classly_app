import 'package:classly_app/core/widgets/navigation_shell/bottom_navigation_shell.dart';
import 'package:classly_app/features/auth/constants/auth_routes.dart';
import 'package:classly_app/features/auth/presentation/pages/login_page.dart';
import 'package:classly_app/features/students/consts/students_routes.dart';
import 'package:classly_app/features/students/presentation/pages/students_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: AuthRoutes.login.path,
  routes: [
    GoRoute(
      path: AuthRoutes.login.path,
      builder: (context, state) => const LoginPage(),
    ),
    // bottom navigation with branches
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainNavigationShell(navigationShell: navigationShell),

      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: StudentsRoutes.students.path,
              builder: (context, state) => const StudentsPage(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/classes',
              builder: (context, state) =>
                  const Scaffold(body: Center(child: Text('Classes Page'))),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/chat',
              builder: (context, state) =>
                  const Scaffold(body: Center(child: Text('Chat Page'))),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/attendance',
              builder: (context, state) =>
                  const Scaffold(body: Center(child: Text('Attendance Page'))),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/payments',
              builder: (context, state) =>
                  const Scaffold(body: Center(child: Text('Payments Page'))),
            ),
          ],
        ),
      ],
    ),
  ],
);
