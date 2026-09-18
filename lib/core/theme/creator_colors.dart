import 'package:flutter/material.dart';

/// Exact color palette for Creator Side derived from HTML Tailwind config.
abstract final class CreatorColors {
  static const Color primary = Color(0xFF1A23DB);
  static const Color primaryContainer = Color(0xFF3B46F1);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onPrimaryContainer = Color(0xFFD7D8FF);
  static const Color primaryFixed = Color(0xFFE0E0FF);
  static const Color primaryFixedDim = Color(0xFFBEC2FF);
  static const Color onPrimaryFixed = Color(0xFF00026C);
  static const Color onPrimaryFixedVariant = Color(0xFF1720D9);

  static const Color secondary = Color(0xFF2D37E6);
  static const Color secondaryContainer = Color(0xFF4A56FE);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onSecondaryContainer = Color(0xFFF0EEFF);
  static const Color secondaryFixed = Color(0xFFE0E0FF);
  static const Color secondaryFixedDim = Color(0xFFBEC2FF);

  static const Color background = Color(0xFFF8F9FF);
  static const Color surface = Color(0xFFF8F9FF);
  static const Color surfaceBright = Color(0xFFF8F9FF);
  static const Color surfaceDim = Color(0xFFCBDBF5);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFEFF4FF);
  static const Color surfaceContainer = Color(0xFFE5EEFF);
  static const Color surfaceContainerHigh = Color(0xFFDCE9FF);
  static const Color surfaceContainerHighest = Color(0xFFD3E4FE);

  static const Color onSurface = Color(0xFF0B1C30);
  static const Color onSurfaceVariant = Color(0xFF454556);
  static const Color tertiary = Color(0xFF2E37B1);
  static const Color tertiaryContainer = Color(0xFF4952CA);
  static const Color error = Color(0xFFBA1A1A);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF93000A);
  static const Color outline = Color(0xFF757588);
  static const Color outlineVariant = Color(0xFFC6C5D9);

  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryContainer, secondaryContainer],
  );
}
