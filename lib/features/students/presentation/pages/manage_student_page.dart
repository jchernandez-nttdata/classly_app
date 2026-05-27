import 'package:classly_app/core/services/service_locator.dart';
import 'package:classly_app/core/utils/extensions/build_context_extension.dart';
import 'package:classly_app/core/utils/utils.dart';
import 'package:classly_app/core/widgets/widgets.dart';
import 'package:classly_app/features/students/domain/cubits/manage_student/manage_student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ManageStudentPage extends StatelessWidget {
  const ManageStudentPage({this.studentId, super.key});

  final int? studentId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ManageStudentCubit>(),
      child: BlocListener<ManageStudentCubit, ManageStudentState>(
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

          if (state.isSuccess) {
            ClasslySnackbar.show(
              context,
              message: context.localizations.operationSuccess,
              type: .success,
            );
            context.pop();
          }
        },
        child: ManageStudentView(studentId: studentId),
      ),
    );
  }
}

class ManageStudentView extends StatelessWidget {
  const ManageStudentView({this.studentId, super.key});

  final int? studentId;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ManageStudentCubit>();
    return SafeArea(
      child: Padding(
        padding: classlyPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 24,
                  children: [
                    ClasslyAppbar(
                      title: getTitle(context),
                      showBackButton: true,
                    ),
                    ClasslyTextField(
                      hintText: context.localizations.name,
                      keyboardType: TextInputType.name,
                      onChanged: (value) => cubit.updateForm(
                        cubit.state.studentFormData.copyWith(name: value),
                      ),
                    ),
                    ClasslyTextField(
                      hintText: context.localizations.email,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => cubit.updateForm(
                        cubit.state.studentFormData.copyWith(email: value),
                      ),
                    ),
                    ClasslyTextField(
                      hintText: context.localizations.dni,
                      keyboardType: TextInputType.number,
                      onChanged: (value) => cubit.updateForm(
                        cubit.state.studentFormData.copyWith(dni: value),
                      ),
                    ),
                    ClasslyTextField(
                      hintText: context.localizations.phone,
                      keyboardType: TextInputType.phone,
                      onChanged: (value) => cubit.updateForm(
                        cubit.state.studentFormData.copyWith(phone: value),
                      ),
                    ),
                    ClasslyTextField(
                      hintText: context.localizations.password,
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) => cubit.updateForm(
                        cubit.state.studentFormData.copyWith(password: value),
                      ),
                    ),
                    ClasslyDatePicker(
                      onDateChanged: (value) => cubit.updateForm(
                        cubit.state.studentFormData.copyWith(birthDate: value),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            ClasslyButton(
              text: context.localizations.save,
              onPressed: cubit.addStudent,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  String getTitle(BuildContext context) => studentId == null
      ? context.localizations.addStudent
      : context.localizations.editStudent;
}
