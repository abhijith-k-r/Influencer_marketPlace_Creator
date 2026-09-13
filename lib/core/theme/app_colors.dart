import 'package:flutter/material.dart';

/// Global color palette for the Creator Application.
/// Centralized here so any brand/theme update instantly reflects everywhere.
abstract final class AppColors {
  // Brand Primaries
  static const Color primary = Color(0xFF4648D4);
  static const Color primaryDark = Color(0xFF2F2EBE);
  static const Color primaryLight = Color(0xFF6063EE);

  // Soft Tint Accents
  static const Color pillBackground = Color(0xFFE1E0FF);
  static const Color liveBadgeBackground = Color(0xFFDCE9FF);
  static const Color strengthInactive = Color(0xFFD3E4FE);
  static const Color trustBadgeBackground = Color(0xFFE5EEFF);
  static const Color inputBackground = Color(0xFFEFF4FF);
  static const Color avatarBorder = Color(0xFFFFFFFF);

  // Text & Content
  static const Color textPrimary = Color(0xFF0B1C30);
  static const Color textSecondary = Color(0xFF45464D);
  static const Color textPlaceholder = Color(0xFF76777D);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color dotDivider = Color(0xFFC6C6CD);

  // Surfaces & Backgrounds
  static const Color surfaceWhite = Color(0xFFFFFFFF);
  static const Color scaffoldBackground = Color(0xFFF9FAFF);
  static const Color buttonPrimary = Color(0xFF000000);
  static const Color inputBorder = Colors.transparent;

  // Semantic
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF2E7D32);

  // Gradients
  static const LinearGradient cardTopGradient = LinearGradient(
    colors: [Color(0xFFE1E0FF), Color(0xFF4648D4), Color(0xFFDAE2FD)],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient ambientAuraGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0x66E1E0FF), Color(0x4DDAE2FD), Color(0x99DCE9FF)],
  );
}
