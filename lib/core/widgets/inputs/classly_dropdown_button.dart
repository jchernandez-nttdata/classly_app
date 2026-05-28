import 'package:flutter/material.dart';

class ClasslyDropdownButtonItem {
  const ClasslyDropdownButtonItem({
    required this.id,
    required this.label,
  });

  final String id;
  final String label;
}

class ClasslyDropdownButton extends StatelessWidget {
  const ClasslyDropdownButton({
    required this.items,
    this.isLoading = false,
    this.label = '',
    this.onChanged,
    super.key,
  });

  final List<ClasslyDropdownButtonItem> items;
  final bool isLoading;
  final String label;
  final void Function({ClasslyDropdownButtonItem? item})? onChanged;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return DropdownMenu(
          width: constraints.maxWidth,
          trailingIcon: const Icon(Icons.keyboard_arrow_down_rounded),
          selectedTrailingIcon: const Icon(Icons.keyboard_arrow_up_rounded),
          dropdownMenuEntries: items.map((item) {
            return DropdownMenuEntry(
              value: item.id,
              label: item.label,
            );
          }).toList(),
          onSelected: (value) {
            final selectedItem = items.firstWhere((item) => item.id == value);
            onChanged?.call(item: selectedItem);
          },
        );
      },
    );
  }
}
