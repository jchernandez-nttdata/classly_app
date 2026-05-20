import 'package:classly_app/features/auth/constants/auth_routes.dart';
import 'package:classly_app/features/auth/presentation/pages/login_page.dart';
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
