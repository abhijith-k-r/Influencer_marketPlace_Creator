import 'package:flutter/material.dart';

/// Global Spacing & Layout Tokens.
/// Centralizes all paddings, margins, and gaps across the application.
abstract final class AppSpacing {
  // Numeric values
  static const double xxs = 2.0;
  static const double xs = 4.0;
  static const double sm = 6.0;
  static const double md = 8.0;
  static const double lg = 12.0;
  static const double xl = 16.0;
  static const double xxl = 24.0;
  static const double xxxl = 32.0;
  static const double huge = 40.0;

  // Edge Insets
  static const EdgeInsets paddingScreen = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 24.0,
  );

  static const EdgeInsets paddingCard = EdgeInsets.only(
    left: 24.0,
    right: 24.0,
    top: 32.0,
    bottom: 40.0,
  );

  static const EdgeInsets paddingInput = EdgeInsets.symmetric(
    horizontal: 14.0,
    vertical: 13.0,
  );

  static const EdgeInsets paddingPill = EdgeInsets.symmetric(
    horizontal: 12.0,
    vertical: 4.0,
  );

  static const EdgeInsets paddingLiveBadge = EdgeInsets.symmetric(
    horizontal: 8.0,
    vertical: 2.0,
  );

  static const EdgeInsets paddingTrustBar = EdgeInsets.symmetric(
    horizontal: 12.0,
    vertical: 8.0,
  );

  static const EdgeInsets paddingBentoCard = EdgeInsets.all(12.0);

  // Spacing Widgets
  static const SizedBox verticalXs = SizedBox(height: xs);
  static const SizedBox verticalSm = SizedBox(height: sm);
  static const SizedBox verticalMd = SizedBox(height: md);
  static const SizedBox verticalLg = SizedBox(height: lg);
  static const SizedBox verticalXl = SizedBox(height: xl);
  static const SizedBox verticalXxl = SizedBox(height: xxl);
  static const SizedBox verticalHuge = SizedBox(height: huge);

  static const SizedBox horizontalXs = SizedBox(width: xs);
  static const SizedBox horizontalSm = SizedBox(width: sm);
  static const SizedBox horizontalMd = SizedBox(width: md);
  static const SizedBox horizontalLg = SizedBox(width: lg);
  static const SizedBox horizontalXl = SizedBox(width: xl);
}
