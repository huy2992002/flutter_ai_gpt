import 'package:flutter/material.dart';
import 'package:flutter_ai_gpt/theme/ag_color_scheme.dart';
import 'package:flutter_ai_gpt/theme/ag_text_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class AGTheme {
  AGTheme._();

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AGColorScheme.lightColorScheme(),
      fontFamily: GoogleFonts.nunitoSans().fontFamily,
      textTheme: AGTextTheme.primaryTextTheme(),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AGColorScheme.darkColorScheme(),
      fontFamily: GoogleFonts.nunitoSans().fontFamily,
      textTheme: AGTextTheme.primaryTextTheme(),
    );
  }
}
