import 'package:classly_app/core/theme/classly_colors.dart';
import 'package:classly_app/core/utils/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class ClasslyButton extends StatelessWidget {
  const ClasslyButton({
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    super.key,
  });

  final void Function() onPressed;
  final String text;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      child: Text(
        text,
        style: TextStyle(color: context.colorScheme.white),
      ),
    );
  }
}
