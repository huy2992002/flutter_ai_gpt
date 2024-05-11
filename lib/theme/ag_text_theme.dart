import 'package:flutter/material.dart';

class AGTextTheme {
  AGTextTheme._();

  static TextTheme primaryTextTheme() {
    return const TextTheme(
      displayLarge: TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.w700,
      ),
      headlineLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      ),
      titleLarge:  TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
