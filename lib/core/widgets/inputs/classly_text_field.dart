import 'package:flutter/material.dart';

class ClasslyTextField extends StatefulWidget {
  const ClasslyTextField({
    super.key,
    this.onChanged,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
  });

  final void Function(String value)? onChanged;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String? value)? validator;
  final Widget? prefixIcon;

  @override
  State<ClasslyTextField> createState() => _ClasslyTextFieldState();
}

class _ClasslyTextFieldState extends State<ClasslyTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final isPasswordField = widget.obscureText;

    return TextFormField(
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      obscureText: _isObscured,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: isPasswordField
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
                icon: Icon(
                  _isObscured
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              )
            : null,
      ),
    );
  }
}
