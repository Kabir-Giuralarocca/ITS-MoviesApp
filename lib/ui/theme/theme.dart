import 'package:flutter/material.dart';
import 'package:movies_app/ui/theme/text_styles.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.grey.shade200,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade200,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(semibold_16),
        foregroundColor: const MaterialStatePropertyAll(Colors.white),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.pressed)
              ? Colors.grey.shade900
              : Colors.black,
        ),
        minimumSize: const MaterialStatePropertyAll(
          Size.fromHeight(44),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(semibold_16),
        foregroundColor: const MaterialStatePropertyAll(Colors.black),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.pressed)
              ? Colors.grey.shade100
              : Colors.transparent,
        ),
        side: const MaterialStatePropertyAll(
          BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        minimumSize: const MaterialStatePropertyAll(
          Size.fromHeight(44),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: regular_14.copyWith(color: Colors.grey),
      errorStyle: regular_12.copyWith(color: Colors.red),
      border: InputBorder.none,
      suffixIconColor: Colors.grey.shade700,
      contentPadding: EdgeInsets.zero,
      isDense: true,
    ),
  );
}
