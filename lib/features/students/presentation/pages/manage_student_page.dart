import 'package:classly_app/core/utils/extensions/build_context_extension.dart';
import 'package:classly_app/core/utils/utils.dart';
import 'package:classly_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ManageStudentPage extends StatelessWidget {
  const ManageStudentPage({this.studentId, super.key});

  final int? studentId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: classlyPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 24,
                  children: [
                    ClasslyAppbar(
                      title: getTitle(context),
                      showBackButton: true,
                    ),
                    ClasslyTextField(
                      hintText: context.localizations.name,
                      keyboardType: TextInputType.name,
                      onChanged: (value) {},
                    ),
                    ClasslyTextField(
                      hintText: context.localizations.email,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {},
                    ),
                    ClasslyTextField(
                      hintText: context.localizations.dni,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
                    ),
                    ClasslyTextField(
                      hintText: context.localizations.birthdate,
                      keyboardType: TextInputType.datetime,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            ClasslyButton(text: context.localizations.save, onPressed: () {}),
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
