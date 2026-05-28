import 'dart:async';

import 'package:classly_app/core/services/service_locator.dart';
import 'package:classly_app/core/theme/classly_colors.dart';
import 'package:classly_app/core/utils/extensions/build_context_extension.dart';
import 'package:classly_app/core/utils/utils.dart';
import 'package:classly_app/core/widgets/navigation_shell/shell_config.dart';
import 'package:classly_app/core/widgets/widgets.dart';
import 'package:classly_app/features/students/consts/students_routes.dart';
import 'package:classly_app/features/students/domain/cubits/students/students_cubit.dart';
import 'package:classly_app/features/students/presentation/widgets/student_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<StudentsCubit>(),
      child: BlocListener<StudentsCubit, StudentsState>(
        listenWhen: (previous, current) =>
            previous.requestStatus != current.requestStatus,
        listener: (context, state) {
          if (state.isError) {
            ClasslySnackbar.show(
              context,
              message: context.localizations.operationFailed,
              type: .error,
            );
          }
        },
        child: const StudentsView(),
      ),
    );
  }
}

class StudentsView extends StatefulWidget {
  const StudentsView({super.key});

  @override
  State<StudentsView> createState() => _StudentsViewState();

  static ShellPageConfig config(BuildContext context) {
    return ShellPageConfig(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final studentsCubit = context.read<StudentsCubit>();
          await context.pushNamed(StudentsRoutes.addStudent.name);
          if (!context.mounted) return;
          unawaited(studentsCubit.fetchStudents());
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _StudentsViewState extends State<StudentsView> {
  @override
  void initState() {
    unawaited(context.read<StudentsCubit>().fetchStudents());
    super.initState();
  }

  Future<void> _onRefresh() async {
    await context.read<StudentsCubit>().fetchStudents();
  }

  @override
  Widget build(BuildContext context) {
    final students = context.select(
      (StudentsCubit cubit) => cubit.state.students,
    );

    final isLoading = context.select(
      (StudentsCubit cubit) => cubit.state.isLoading,
    );

    return SafeArea(
      child: Padding(
        padding: classlyPadding(),
        child: Column(
          children: [
            ClasslyAppbar(
              title: context.localizations.students,
            ),
            const SizedBox(height: 24),
            ClasslyTextField(
              prefixIcon: const Icon(Icons.search),
              onChanged: (value) {
                context.read<StudentsCubit>().filterStudents(value);
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _onRefresh,
                child: Builder(
                  builder: (context) {
                    if (isLoading && students.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (students.isEmpty) {
                      return SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Center(
                            child: Text(
                              context.localizations.emptyStudents,
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
                      itemCount: students.length,
                      itemBuilder: (context, index) {
                        final student = students[index];

                        return StudentTile(
                          student: student,
                          onEdit: () async {
                            final studentsCubit = context.read<StudentsCubit>();

                            await context.pushNamed(
                              StudentsRoutes.editStudent.name,
                              pathParameters: {
                                'id': student.id.toString(),
                              },
                              extra: student.toJson(),
                            );

                            if (!mounted) return;

                            unawaited(studentsCubit.fetchStudents());
                          },
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
