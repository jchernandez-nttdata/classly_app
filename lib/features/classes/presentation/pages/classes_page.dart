import 'dart:async';

import 'package:classly_app/core/services/service_locator.dart';
import 'package:classly_app/core/theme/classly_colors.dart';
import 'package:classly_app/core/utils/extensions/build_context_extension.dart';
import 'package:classly_app/core/utils/utils.dart';
import 'package:classly_app/core/widgets/widgets.dart';
import 'package:classly_app/features/classes/domain/cubits/classes/classes_cubit.dart';
import 'package:classly_app/features/classes/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassesPage extends StatelessWidget {
  const ClassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ClassesCubit>(),
      child: const ClassesView(),
    );
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
    unawaited(context.read<ClassesCubit>().fetchLocations());
    unawaited(context.read<ClassesCubit>().fetchClasses());
    super.initState();
  }

  Future<void> _onRefresh() async {
    await context.read<ClassesCubit>().fetchClasses();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ClassesCubit>().state;
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
            ClasslyDropdownButton(
              label: context.localizations.selectLocation,
              isLoading: state.isLocationsLoading,
              items: state.locations
                  .map(
                    (location) => ClasslyDropdownButtonItem(
                      id: location.id.toString(),
                      label: location.name,
                    ),
                  )
                  .toList(),
              onChanged: (item) {
                final locationId = int.tryParse(item?.id ?? '');
                unawaited(
                  context.read<ClassesCubit>().fetchClasses(
                    locationId: locationId,
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            Expanded(
              child: RefreshIndicator(
                onRefresh: _onRefresh,
                child: Builder(
                  builder: (context) {
                    if (state.isClassesLoading && state.classes.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state.classes.isEmpty) {
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
                      itemCount: state.classes.length,
                      itemBuilder: (context, index) {
                        final classSchedule = state.classes[index];

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
