import 'package:classly_app/core/utils/extensions/build_context_extension.dart';
import 'package:classly_app/features/classes/domain/entities/class.dart';
import 'package:classly_app/features/classes/domain/entities/day_of_week.dart';
import 'package:flutter/material.dart';

class ClassTile extends StatelessWidget {
  const ClassTile({
    required this.classSchedule,
    this.onTap,
    super.key,
  });

  final ClassSchedule classSchedule;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    classSchedule.className,
                    style: context.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${classSchedule.dayOfWeek.localized(context)}, '
                    '${classSchedule.initTime} - ${classSchedule.endTime}',
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
