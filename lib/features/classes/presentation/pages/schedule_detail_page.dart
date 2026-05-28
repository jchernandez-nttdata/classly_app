import 'package:classly_app/core/theme/classly_colors.dart';
import 'package:classly_app/core/utils/extensions/build_context_extension.dart';
import 'package:classly_app/core/utils/utils.dart';
import 'package:classly_app/core/widgets/widgets.dart';
import 'package:classly_app/features/classes/domain/entities/class_schedule.dart';
import 'package:classly_app/features/classes/domain/entities/day_of_week.dart';
import 'package:classly_app/features/classes/domain/entities/enrolled_student.dart';
import 'package:classly_app/features/classes/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ScheduleDetailPage extends StatelessWidget {
  const ScheduleDetailPage({
    required this.scheduleId,
    required this.schedule,
    super.key,
  });

  final int scheduleId;
  final ClassSchedule schedule;

  @override
  Widget build(BuildContext context) {
    return ScheduleDetailView(scheduleId: scheduleId, schedule: schedule);
  }
}

class ScheduleDetailView extends StatefulWidget {
  const ScheduleDetailView({
    required this.scheduleId,
    required this.schedule,
    super.key,
  });

  final int scheduleId;
  final ClassSchedule schedule;

  @override
  State<ScheduleDetailView> createState() => _ScheduleDetailViewState();
}

class _ScheduleDetailViewState extends State<ScheduleDetailView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: classlyPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClasslyAppbar(
              title: context.localizations.schedule,
              showBackButton: true,
            ),
            const SizedBox(height: 16),
            _ScheduleInfoCard(
              schedule: widget.schedule,
              enrolledStudents: 10,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return EnrolledStudentTile(
                    student: EnrolledStudent(
                      userScheduleId: index,
                      name: 'Student $index',
                      dni: 'DNI $index',
                      remainingClasses: index,
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScheduleInfoCard extends StatelessWidget {
  const _ScheduleInfoCard({
    required this.schedule,
    required this.enrolledStudents,
  });

  final ClassSchedule schedule;
  final int enrolledStudents;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.onSurface.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    schedule.className,
                    style: context.textTheme.titleMedium,
                  ),
                ),
                Text(schedule.initTime),
              ],
            ),
            Text(
              '${schedule.dayOfWeek.localized(context)} - '
              '${schedule.location}',
            ),
            Text(
              context.localizations.enrolledStudents(0),
            ),
          ],
        ),
      ),
    );
  }
}
