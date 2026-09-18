import 'package:flutter/material.dart';

/// Global color palette extracted directly from the HTML Tailwind specifications.
/// Provides exact color tokens for both Brand (Crimson Red) and Creator (Indigo Blue) sides.
abstract final class AppColors {
  // Brand Palette (Crimson Red)
  static const Color primary = Color(0xFFB9092F);
  static const Color primaryContainer = Color(0xFFDC2D45);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onPrimaryContainer = Color(0xFFFFFBFF);
  static const Color primaryFixed = Color(0xFFFFDAD9);
  static const Color onPrimaryFixed = Color(0xFF400009);
  static const Color primaryFixedDim = Color(0xFFFFB3B3);
  static const Color onPrimaryFixedVariant = Color(0xFF920022);
  static const Color inversePrimary = Color(0xFFFFB3B3);

  // Creator Palette (Indigo Blue)
  static const Color secondary = Color(0xFF2D37E6);
  static const Color secondaryContainer = Color(0xFF4A56FE);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onSecondaryContainer = Color(0xFFF0EEFF);
  static const Color secondaryFixed = Color(0xFFE0E0FF);
  static const Color onSecondaryFixed = Color(0xFF00026C);
  static const Color secondaryFixedDim = Color(0xFFBEC2FF);
  static const Color onSecondaryFixedVariant = Color(0xFF1720D9);

  // Tertiary Palette
  static const Color tertiary = Color(0xFF545C72);
  static const Color tertiaryContainer = Color(0xFF6C748B);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color onTertiaryContainer = Color(0xFFFEFCFF);
  static const Color tertiaryFixed = Color(0xFFDAE2FD);
  static const Color tertiaryFixedDim = Color(0xFFBEC6E0);
  static const Color onTertiaryFixed = Color(0xFF131B2E);
  static const Color onTertiaryFixedVariant = Color(0xFF3F465C);

  // Surfaces & Backgrounds
  static const Color background = Color(0xFFF8F9FF);
  static const Color surface = Color(0xFFF8F9FF);
  static const Color surfaceBright = Color(0xFFF8F9FF);
  static const Color surfaceDim = Color(0xFFCBDBF5);
  static const Color surfaceVariant = Color(0xFFD3E4FE);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFEFF4FF);
  static const Color surfaceContainer = Color(0xFFE5EEFF);
  static const Color surfaceContainerHigh = Color(0xFFDCE9FF);
  static const Color surfaceContainerHighest = Color(0xFFD3E4FE);
  static const Color surfaceTint = Color(0xFFBC0E31);

  // Text & On-Colors
  static const Color onSurface = Color(0xFF0B1C30);
  static const Color onSurfaceVariant = Color(0xFF5B4040);
  static const Color onBackground = Color(0xFF0B1C30);

  // Outlines & Borders
  static const Color outline = Color(0xFF8F6F6F);
  static const Color outlineVariant = Color(0xFFE4BDBD);
  static const Color borderLight = Color(0xFFE5EEFF);

  // Inverses
  static const Color inverseSurface = Color(0xFF213145);
  static const Color inverseOnSurface = Color(0xFFEAF1FF);

  // Semantic & Error
  static const Color error = Color(0xFFBA1A1A);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color onErrorContainer = Color(0xFF93000A);
  static const Color emerald = Color(0xFF10B981);

  // Gradients matching HTML
  static const LinearGradient splashGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      primaryContainer,
      primary,
      onPrimaryFixedVariant,
    ],
  );

  static const LinearGradient avatarBorderGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      primary,
      primaryContainer,
      secondaryContainer,
    ],
  );

  static const LinearGradient tipCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      surfaceContainerHigh,
      surfaceContainer,
      surfaceVariant,
    ],
  );

  // Backward-compatibility & semantic aliases
  static const Color surfaceWhite = Color(0xFFFFFFFF);
  static const Color textPrimary = onSurface;
  static const Color textSecondary = tertiary;
  static const Color textTertiary = outline;
  static const Color scaffoldBackground = background;
  static const Color inputBackground = surfaceContainerLow;
  static const Color pillBackground = surfaceContainer;
  static const Color buttonPrimary = primary;
  static const Color primaryDark = onPrimaryFixedVariant;
  static const Color primaryLight = primaryFixedDim;
  static const Color avatarBorder = outlineVariant;
  static const Color trustBadgeBackground = surfaceContainerLow;
  static const Color strengthInactive = surfaceContainerHigh;
  static const Color liveBadgeBackground = surfaceContainerHighest;
  static const Color dotDivider = outlineVariant;

  static const LinearGradient cardTopGradient = tipCardGradient;
  static const LinearGradient ambientAuraGradient = splashGradient;
}
