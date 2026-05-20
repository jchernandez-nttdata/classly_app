import 'package:classly_app/core/theme/classly_colors.dart';
import 'package:classly_app/core/utils/extensions/build_context_extension.dart';
import 'package:classly_app/features/students/domain/entities/student.dart';
import 'package:flutter/material.dart';

class StudentTile extends StatelessWidget {
  const StudentTile({
    required this.student,
    this.onEdit,
    super.key,
  });

  final Student student;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      Icons.credit_card_rounded,
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
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 16,
                      color: context.colorScheme.grayColor,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        student.email,
                        style: context.textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            visualDensity: VisualDensity.compact,
            onPressed: onEdit,
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
