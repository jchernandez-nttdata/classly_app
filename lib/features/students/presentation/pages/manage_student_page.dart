import 'package:classly_app/core/utils/extensions/build_context_extension.dart';
import 'package:classly_app/core/utils/utils.dart';
import 'package:classly_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ManageStudentPage extends StatelessWidget {
  const ManageStudentPage({this.studentId, super.key});

  final int? studentId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: classlyPadding(),
        child: Column(
          children: [
            ClasslyAppbar(
              title: 'Manage Student',
              showBackButton: true,
            ),
            const SizedBox(height: 24),
            Text('Student ID: ${studentId ?? 'New Student'}'),
          ],
        ),
      ),
    );
  }
}
