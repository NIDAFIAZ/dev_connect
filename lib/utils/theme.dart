import 'package:flutter/material.dart';

class AppTheme {
  // 🔥 Color Palette - Modern & Professional
  static const Color primaryColor = Color(0xFF03346E);       // Deep Navy Blue
  static const Color secondaryColor = Color(0xFF6EACDA);     // Light Blue Accent
  static const Color backgroundColor = Color(0xFFF9FAFB);    // Soft Grey Background
  static const Color textColor = Color(0xFF222222);          // Dark Grey Text
  static const Color cardColor = Color(0xFFFFFFFF);          // Pure White Card
  static const Color accentColor = Color(0xFFE2E2B6);        // Soft Yellowish Accent for highlights

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 2,
      titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: textColor, fontSize: 16, fontFamily: 'Poppins'),
      bodyMedium: TextStyle(color: textColor, fontSize: 14, fontFamily: 'Poppins'),
      titleLarge: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 18),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      labelStyle: TextStyle(color: textColor, fontSize: 14),
      hintStyle: TextStyle(color: Colors.grey),
    ),
    cardColor: cardColor,
    iconTheme: IconThemeData(color: secondaryColor),
  );
}
