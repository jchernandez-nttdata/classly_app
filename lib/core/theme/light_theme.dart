import 'package:classly_app/core/theme/classly_colors.dart';
import 'package:flutter/material.dart';

class LightTheme {
  final ColorScheme _colorExtension = ThemeData().colorScheme;
  double get _borderRadius => 16;
  ThemeData theme() => ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: _colorExtension.primaryColor,
    ),
    fontFamily: 'Poppins',
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      hintStyle: TextStyle(color: _colorExtension.grayColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
        borderSide: BorderSide(color: _colorExtension.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
        borderSide: BorderSide(color: _colorExtension.borderColor),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _colorExtension.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _colorExtension.surface,
      selectedItemColor: _colorExtension.primaryColor,
      unselectedItemColor: _colorExtension.grayColor,
      elevation: 10,
      showUnselectedLabels: true,
    ),
  );
}
