import 'package:flutter/material.dart';

class AppColors {
  // * Non initable class
  const AppColors._();

  /// Primary Colors (based on #21A8E1)
  static const Color primary = Color(0xFF21A8E1); // Bright Blue from the logo
  static const Color primaryAccent = Color(0xFF1590B8); // A slightly muted blue for accents
  static const Color primaryContrast = Colors.white; // White for contrast

  /// Secondary Colors (based on #010101)
  static const Color secondary = Color(0xFF010101); // Dark color from the logo
  static const Color secondaryAccent = Color(0xFF303030); // Slightly lighter dark gray

  static const Color calendarBorder = Color(0xFFD0EAF5); // Light blue for borders
  static const Color calendarText = Color(0xFF4A4A4A); // Dark Gray for text

  /// Background Colors
  static const Color background = Color(0xFFF4F8FB); // Very light blue for a fresh background
  static const Color surface = Colors.white; // White for clean surfaces like cards

  /// Text Colors
  static const Color textColor = Color(0xFF010101); // Dark color from the logo for main text
  static const Color secondaryText = Color(0xFF6B6B6B); // Muted Gray for secondary text

  /// Accent Colors
  static const Color success = Color(0xFF7ED321); // Bright Green for task completion
  static const Color warning = Color(0xFFFFCC00); // Warm Yellow for priority highlights
  static const Color error = Color(0xFFFF6F61); // Soft Red for overdue tasks

  /// Error Text
  static const Color errorText = Color(0xFFFF6F61); // Same as error color for error text

  static const Color progressColorStart = Color(0xFF3366FF);
  static const Color progressColorEnd = Color(0xFF00CCFF);


  static const Color appBarColor = Color(0xFF003366);
  static const Color enabledButton = Color(0xFFCECECE);
  static const Color disabledButton = Color(0xFFE0E0E0);
  static const Color disabledText = Color(0xFFBDBDBD);
  static const Color foreground = Color(0xFFFFFFFF);
  static const Color darkText = Color(0xFFEAF5FF);
  static const Color lightText = Color(0xFFFFFFFF);
  static const Color headerGrey = Color(0xff7E8289);
  static const Color warningOrange = Color(0xFFFFB443);
  static const Color green = Colors.green;
  static const Color criticalRed = Color(0xFFE44545);

  static const Color textTitleColor = Color(0xFF023E8A);
  static const Color buttonColor = Color(0xFF20B2AA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

}
