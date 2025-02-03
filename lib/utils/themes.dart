import 'package:flutter/material.dart';

class Themes {
  static ThemeData appThemeDark() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        primary: Colors.grey.shade400,
        onPrimary: Colors.black,
        secondary: Colors.grey.shade800,
        onSecondary: Colors.white,
        surface: Colors.grey.shade400,
        onSurface: Colors.black,
        error: Colors.orange,
        onError: Colors.red,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade800,
        titleTextStyle: TextStyle(fontSize: 24, color: Colors.white),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 0,
      ),
      scaffoldBackgroundColor: Colors.grey.shade700,
      inputDecorationTheme: InputDecorationTheme(
        focusColor: Colors.grey.shade800,
        filled: true,
        fillColor: Colors.grey.shade800,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 16,
        ),
        labelStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 16,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade800,
          foregroundColor: Colors.grey.shade400,
          minimumSize: const Size(64, 32),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  static ThemeData appThemeLight() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        primary: Colors.grey.shade800,
        onPrimary: Colors.white,
        secondary: Colors.grey.shade400,
        onSecondary: Colors.black,
        surface: Colors.grey.shade800,
        onSurface: Colors.white,
        error: Colors.red,
        onError: Colors.orange,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade400,
        titleTextStyle: TextStyle(fontSize: 24, color: Colors.black),
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
      ),
      scaffoldBackgroundColor: Colors.grey.shade300,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade400,
          foregroundColor: Colors.grey.shade800,
          minimumSize: const Size(64, 32),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
