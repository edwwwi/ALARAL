import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryBackground = Color(0xFF000000);
  static const Color secondaryBackground = Color(0xFF101010);
  static const Color cardColor = Color(0xFF171717);
  static const Color borderColor = Color(0xFF2A2A2A);
  
  static const Color primaryText = Colors.white;
  static const Color secondaryText = Color(0xFF9D9D9D);
  static const Color disabledText = Color(0xFF707070);
  
  static const Color success = Color(0xFF59D185);
  static const Color warning = Color(0xFFFFB547);
  static const Color danger = Color(0xFFFF5C5C);
  static const Color accent = Colors.white;

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: primaryBackground,
      primaryColor: accent,
      colorScheme: const ColorScheme.dark(
        primary: accent,
        secondary: accent,
        surface: cardColor,
        background: primaryBackground,
        error: danger,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: primaryText,
        onBackground: primaryText,
        onError: Colors.black,
        outline: borderColor,
      ),
      textTheme: TextTheme(
        // Large Clock
        displayLarge: GoogleFonts.inter(
          fontSize: 60,
          fontWeight: FontWeight.w400,
          color: primaryText,
          letterSpacing: -2.0,
        ),
        // Page Titles
        headlineLarge: GoogleFonts.inter(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: primaryText,
          letterSpacing: -1.0,
        ),
        // Section Titles
        titleLarge: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: primaryText,
          letterSpacing: -0.5,
        ),
        // Card Title
        titleMedium: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: primaryText,
          letterSpacing: -0.3,
        ),
        // Body
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: primaryText,
          letterSpacing: 0,
        ),
        // Body Secondary
        bodyMedium: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: secondaryText,
          letterSpacing: 0,
        ),
        // Caption
        labelSmall: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: secondaryText,
          letterSpacing: 0.2,
        ),
      ),
      cardTheme: CardThemeData(
        color: cardColor,
        elevation: 0, // Shadows handled by custom widgets if needed, but spec says "almost invisible"
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: borderColor, width: 1),
        ),
        margin: EdgeInsets.zero,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: primaryText),
      ),
      dividerTheme: const DividerThemeData(
        color: borderColor,
        thickness: 1,
        space: 1,
      ),
      iconTheme: const IconThemeData(
        color: primaryText,
      ),
    );
  }
}
