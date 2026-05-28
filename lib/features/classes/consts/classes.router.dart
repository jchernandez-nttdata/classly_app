import 'package:classly_app/features/classes/consts/classes_routes.dart';
import 'package:classly_app/features/classes/presentation/pages/classes_page.dart';
import 'package:go_router/go_router.dart';

final List<GoRoute> classesRouter = [
  GoRoute(
    path: ClassesRoutes.classes.path,
    name: ClassesRoutes.classes.name,
    builder: (context, state) => const ClassesPage(),
  ),
];
