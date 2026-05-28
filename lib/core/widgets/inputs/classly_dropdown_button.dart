import 'package:classly_app/core/utils/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class ClasslyDropdownButtonItem {
  const ClasslyDropdownButtonItem({
    required this.id,
    required this.label,
  });

  final String id;
  final String label;
}

class ClasslyDropdownButton extends StatefulWidget {
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
  final void Function(ClasslyDropdownButtonItem? item)? onChanged;

  @override
  State<ClasslyDropdownButton> createState() => _ClasslyDropdownButtonState();
}

class _ClasslyDropdownButtonState extends State<ClasslyDropdownButton> {
  final TextEditingController _controller = TextEditingController();

  String? _selectedId;

  void _clearSelection() {
    setState(() {
      _selectedId = null;
      _controller.clear();
    });

    widget.onChanged?.call(null);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return DropdownMenu<String>(
          controller: _controller,
          width: constraints.maxWidth,
          label: Text(
            widget.isLoading ? context.localizations.loading : widget.label,
          ),
          trailingIcon: _selectedId != null
              ? InkWell(
                  onTap: _clearSelection,
                  child: const Icon(Icons.close_rounded),
                )
              : const Icon(Icons.keyboard_arrow_down_rounded),
          selectedTrailingIcon: const Icon(Icons.keyboard_arrow_up_rounded),
          dropdownMenuEntries: widget.items.map((item) {
            return DropdownMenuEntry<String>(
              value: item.id,
              label: item.label,
            );
          }).toList(),
          onSelected: (value) {
            if (value == null) return;

            final selectedItem = widget.items.firstWhere(
              (item) => item.id == value,
            );

            setState(() {
              _selectedId = value;
            });

            widget.onChanged?.call(selectedItem);
          },
        );
      },
    );
  }
}
