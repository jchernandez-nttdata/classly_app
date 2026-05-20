import 'package:classly_app/core/theme/classly_colors.dart';
import 'package:classly_app/core/utils/extensions/build_context_extension.dart';
import 'package:classly_app/core/utils/utils.dart';
import 'package:classly_app/core/widgets/navigation_shell/shell_config.dart';
import 'package:classly_app/core/widgets/widgets.dart';
import 'package:classly_app/features/students/domain/entities/student.dart';
import 'package:classly_app/features/students/presentation/widgets/student_tile.dart';
import 'package:flutter/material.dart';

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: classlyPadding(),
        child: Column(
          children: [
            ClasslyAppbar(title: context.localizations.students),
            const SizedBox(height: 24),
            ClasslyTextField(
              prefixIcon: const Icon(Icons.search),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: 15,
                itemBuilder: (context, index) => StudentTile(
                  student: Student(
                    id: index,
                    name: 'Student $index',
                    email: 'student$index@example.com',
                    dni: '12345678$index',
                    phone: '+1234567890',
                    birthDate: DateTime(2000, 1, 1),
                  ),
                  onEdit: () {},
                ),
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color: context.colorScheme.borderColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static ShellPageConfig config(BuildContext context) {
    return ShellPageConfig(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
