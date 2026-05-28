import 'package:classly_app/features/classes/consts/classes_routes.dart';
import 'package:classly_app/features/classes/domain/entities/class_schedule.dart';
import 'package:classly_app/features/classes/presentation/pages/classes_page.dart';
import 'package:classly_app/features/classes/presentation/pages/schedule_detail_page.dart';
import 'package:go_router/go_router.dart';

final List<GoRoute> classesRouter = [
  GoRoute(
    path: ClassesRoutes.classes.path,
    name: ClassesRoutes.classes.name,
    builder: (context, state) => const ClassesPage(),
    routes: [
      GoRoute(
        path: ClassesRoutes.scheduleDetail.path,
        name: ClassesRoutes.scheduleDetail.name,
        builder: (context, state) {
          final scheduleId = int.parse(state.pathParameters['scheduleId']!);
          final raw = state.extra! as Map<String, dynamic>;
          return ScheduleDetailPage(
            scheduleId: scheduleId,
            schedule: ClassSchedule.fromJson(raw),
          );
        },
      ),
    ],
  ),
];
