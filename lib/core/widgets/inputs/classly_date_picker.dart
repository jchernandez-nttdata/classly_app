import 'package:classly_app/core/theme/classly_colors.dart';
import 'package:classly_app/core/utils/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class ClasslyDatePicker extends StatefulWidget {
  const ClasslyDatePicker({
    required this.onDateChanged,
    this.initialDate,
    super.key,
  });

  final DateTime? initialDate;
  final ValueChanged<DateTime> onDateChanged;

  @override
  State<ClasslyDatePicker> createState() => _ClasslyDatePickerState();
}

class _ClasslyDatePickerState extends State<ClasslyDatePicker> {
  DateTime? _selectedDate;

  @override
  void initState() {
    if (widget.initialDate != null) {
      _selectedDate = widget.initialDate;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showDatePickerDialog(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: context.colorScheme.borderColor),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Text(
          _selectedDate != null
              ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
              : 'Select date',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Future<void> _showDatePickerDialog(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
      widget.onDateChanged(selectedDate);
    }
  }
}
