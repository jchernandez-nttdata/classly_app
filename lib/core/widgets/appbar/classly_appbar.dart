import 'package:classly_app/core/theme/classly_colors.dart';
import 'package:classly_app/core/utils/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class ClasslyAppbar extends StatelessWidget {
  const ClasslyAppbar({
    required this.title,
    this.onBack,
    super.key,
  });

  final String title;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (onBack != null) ...[
          IconButton(
            onPressed: onBack,
            icon: const Icon(Icons.arrow_back_ios_new),
            iconSize: 24,
          ),
          const SizedBox(width: 15),
        ],

        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: context.colorScheme.grayColor,
          ),
        ),
      ],
    );
  }
}
