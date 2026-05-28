import 'dart:async';

import 'package:classly_app/core/theme/classly_colors.dart';
import 'package:classly_app/core/utils/extensions/build_context_extension.dart';
import 'package:classly_app/core/utils/utils.dart';
import 'package:classly_app/core/widgets/widgets.dart';
import 'package:classly_app/features/classes/domain/entities/class.dart';
import 'package:classly_app/features/classes/domain/entities/day_of_week.dart';
import 'package:classly_app/features/classes/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ClassesPage extends StatelessWidget {
  const ClassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClassesView();
  }
}

class ClassesView extends StatefulWidget {
  const ClassesView({super.key});

  @override
  State<ClassesView> createState() => _ClassesViewState();
}

class _ClassesViewState extends State<ClassesView> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _onRefresh() async {}

  static List<ClassSchedule> classes = [
    ClassSchedule(
      id: 1,
      dayOfWeek: DayOfWeek.monday,
      initTime: '08:00',
      endTime: '10:00',
      className: 'Salsa',
      location: 'Sala 101',
    ),
    ClassSchedule(
      id: 2,
      dayOfWeek: DayOfWeek.wednesday,
      initTime: '10:00',
      endTime: '12:00',
      className: 'Marinera',
      location: 'Sala 102',
    ),
    ClassSchedule(
      id: 3,
      dayOfWeek: DayOfWeek.friday,
      initTime: '14:00',
      endTime: '16:00',
      className: 'Danzas',
      location: 'Sala 103',
    ),
  ];

  bool get isLoading => false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: classlyPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClasslyAppbar(
              title: context.localizations.classes,
            ),
            const SizedBox(height: 24),
            const ClasslyDropdownButton(
              items: [
                ClasslyDropdownButtonItem(
                  id: 'salsa',
                  label: 'Salsa',
                ),
                ClasslyDropdownButtonItem(
                  id: 'marinera',
                  label: 'Marinera',
                ),
                ClasslyDropdownButtonItem(
                  id: 'danzas',
                  label: 'Danzas',
                ),
              ],
            ),
            const SizedBox(height: 16),

            Expanded(
              child: RefreshIndicator(
                onRefresh: _onRefresh,
                child: Builder(
                  builder: (context) {
                    if (isLoading && classes.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (classes.isEmpty) {
                      return SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Center(
                            child: Text(
                              context.localizations.emptyClasses,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: context.colorScheme.grayColor,
                                  ),
                            ),
                          ),
                        ),
                      );
                    }

                    return ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: classes.length,
                      itemBuilder: (context, index) {
                        final classSchedule = classes[index];

                        return ClassTile(
                          classSchedule: classSchedule,
                          onTap: () {},
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 1,
                          color: context.colorScheme.borderColor,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
