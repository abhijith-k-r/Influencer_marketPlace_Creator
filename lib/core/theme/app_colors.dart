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
  static const Color textTertiary = Color(0xFF8C8D94);
  static const Color textPlaceholder = Color(0xFF76777D);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color dotDivider = Color(0xFFC6C6CD);

  // Surfaces & Backgrounds
  static const Color surfaceWhite = Color(0xFFFFFFFF);
  static const Color surface = surfaceWhite;
  static const Color scaffoldBackground = Color(0xFFF9FAFF);
  static const Color background = scaffoldBackground;
  static const Color buttonPrimary = Color(0xFF000000);
  static const Color inputBorder = Colors.transparent;
  static const Color borderLight = Color(0xFFEAECF0);

  // Semantic & Status Accents
  static const Color error = Color(0xFFD32F2F);
  static const Color errorLight = Color(0xFFFEE2E2);
  static const Color errorBorder = Color(0xFFFCA5A5);
  static const Color success = Color(0xFF2E7D32);
  static const Color emerald = Color(0xFF10B981);
  static const Color emeraldDark = Color(0xFF059669);
  static const Color emeraldLight = Color(0xFFECFDF5);
  static const Color indigo = Color(0xFF4F46E5);
  static const Color indigoLight = Color(0xFFEEF2FF);
  static const Color indigoBorder = Color(0xFFC7D2FE);
  static const Color indigoPurple = Color(0xFF6366F1);
  static const Color amber = Color(0xFFF59E0B);
  static const Color amberLight = Color(0xFFFEF3C7);
  static const Color amberBorder = Color(0xFFFCD34D);

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

  static const LinearGradient chatBubbleOutgoingGradient = LinearGradient(
    colors: [Color(0xFFE1E0FF), Color(0xFFDCE9FF), Color(0xFFC4E7FF)],
  );

  static const LinearGradient escrowGradient = LinearGradient(
    colors: [Color(0xFF4338CA), Color(0xFF6D28D9), Color(0xFF7C3AED)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient instagramGradient = LinearGradient(
    colors: [Color(0xFF833AB4), Color(0xFFFD1D1D), Color(0xFFFCAF45)],
  );
}
