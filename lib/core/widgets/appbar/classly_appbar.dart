import 'package:classly_app/core/theme/classly_colors.dart';
import 'package:classly_app/core/utils/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ClasslyAppbar extends StatelessWidget {
  const ClasslyAppbar({
    required this.title,
    this.showBackButton = false,
    super.key,
  });

  final String title;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showBackButton) ...[
          IconButton(
            onPressed: context.pop,
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
