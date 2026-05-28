import 'package:classly_app/core/theme/classly_colors.dart';
import 'package:classly_app/core/utils/extensions/build_context_extension.dart';
import 'package:classly_app/features/classes/domain/entities/enrolled_student.dart';
import 'package:flutter/material.dart';

class EnrolledStudentTile extends StatelessWidget {
  const EnrolledStudentTile({
    required this.student,
    this.onDelete,
    super.key,
  });

  final EnrolledStudent student;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.name,
                  style: context.textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      size: 16,
                      color: context.colorScheme.grayColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      student.dni,
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  context.localizations.remainingClasses(
                    student.remainingClasses,
                  ),
                  style: context.textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            visualDensity: VisualDensity.compact,
            onPressed: onDelete,
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
