import 'package:flutter/material.dart';

class AppColorsDark {
  // * Non-initable class
  const AppColorsDark._();

  /// Primary Colors (Darkened tones based on the light theme)
  static const Color primary = Color(0xFF1590B8); // Darkened Bright Blue for the logo
  static const Color primaryAccent = Color(0xFF0D6A8A); // More muted blue for accents
  static const Color primaryContrast = Colors.white; // White for contrast on dark surfaces

  /// Secondary Colors
  static const Color secondary = Color(0xFF2E2E2E); // A softer black for secondary elements
  static const Color secondaryAccent = Color(0xFF474747); // Medium gray for subtle elements

  static const Color calendarBorder = Color(0xFF303030); // Dark Gray for borders
  static const Color calendarText = Color(0xFFB0B0B0); // Light Gray for text on dark backgrounds

  /// Background Colors
  static const Color background = Color(0xFF121212); // Dark Gray for a rich dark mode background
  static const Color surface = Color(0xFF1E1E1E); // Slightly lighter dark gray for surfaces like cards

  /// Text Colors
  static const Color textColor = Colors.white; // White for main text
  static const Color secondaryText = Color(0xFFB0B0B0); // Light Gray for secondary text

  /// Accent Colors
  static const Color success = Color(0xFF4CAF50); // Slightly darker Bright Green
  static const Color warning = Color(0xFFE6A800); // A warmer yellow for highlights
  static const Color error = Color(0xFFD32F2F); // Slightly muted red for errors
}
