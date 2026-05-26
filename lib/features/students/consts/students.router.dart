import 'package:classly_app/features/students/consts/students_routes.dart';
import 'package:classly_app/features/students/presentation/pages/manage_student_page.dart';
import 'package:classly_app/features/students/presentation/pages/students_page.dart';
import 'package:go_router/go_router.dart';

final List<GoRoute> studentRouter = [
  GoRoute(
    path: StudentsRoutes.students.path,
    name: 'students',
    builder: (context, state) => const StudentsPage(),
    routes: [
      GoRoute(
        path: StudentsRoutes.addStudent.path,
        name: 'addStudent',
        builder: (context, state) => const ManageStudentPage(),
      ),
      GoRoute(
        path: StudentsRoutes.editStudent.path,
        name: 'editStudent',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ManageStudentPage(studentId: int.parse(id));
        },
      ),
    ],
  ),
];
