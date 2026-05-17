import 'package:flutter/material.dart';

class ClasslyTextField extends StatelessWidget {
  const ClasslyTextField({
    super.key,
    this.onChanged,
    this.hintText,
    this.keyboardType,
  });

  final void Function(String value)? onChanged;
  final String? hintText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
