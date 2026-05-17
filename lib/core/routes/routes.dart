import 'package:classly_app/features/auth/pages/login_page.dart';
import 'package:classly_app/features/auth/routes/auth_routes.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: AuthRoutes.login.path,
  routes: [
    GoRoute(
      path: AuthRoutes.login.path,
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
