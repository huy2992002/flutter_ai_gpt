import 'package:flutter/material.dart';

class AGColorScheme {
  AGColorScheme._();

  static ColorScheme darkColorScheme() {
    return ColorScheme(
      brightness: Brightness.light,
      primary: const Color(0xFF4F378B),
      onPrimary: const Color(0xFFFFFFFF),
      secondary: const Color(0xFFD0BCFF),
      onSecondary: const Color(0xFFFFFFFF),
      error: Colors.red,
      onError: const Color(0xFFFFFFFF),
      background: const Color(0xFF141218),
      onBackground: const Color(0xFFFFFFFF),
      surface: const Color(0xFFFFFFFF).withOpacity(0.08),
      onSurface: const Color(0xFFFFFFFF),
      primaryContainer: const Color(0xFFFFFFFF).withOpacity(0.08),
      onPrimaryContainer: const Color(0xFFFFFFFF),
      secondaryContainer: const Color(0xFFFFFFFF).withOpacity(0.1),
      onSecondaryContainer: const Color(0xFFFFFFFF).withOpacity(0.2),
    );
  }

  static ColorScheme lightColorScheme() {
    return ColorScheme(
      brightness: Brightness.dark,
      primary: const Color(0xFF10A37F),
      onPrimary: const Color(0xFFFFFFFF),
      secondary: Color.fromARGB(255, 185, 243, 228),
      onSecondary: const Color(0xFFFFFFFF),
      error: Colors.red,
      onError: const Color(0xFFFFFFFF),
      background: const Color(0xFFFFFFFF),
      onBackground: const Color(0xFF141218),
      surface: const Color(0xFF757575).withOpacity(0.08),
      onSurface: const Color(0xFF141218),
      primaryContainer: const Color(0xFF757575).withOpacity(0.08),
      onPrimaryContainer: const Color(0xFF141218),
      secondaryContainer: const Color(0xFF757575).withOpacity(0.1),
      onSecondaryContainer: const Color(0xFF757575).withOpacity(0.2),
    );
  }
}
