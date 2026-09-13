import 'package:flutter/material.dart';

/// Global Border Radii Tokens.
/// Centralizes all curvature dimensions across surfaces, cards, and inputs.
abstract final class AppRadii {
  static const double xs = 6.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double pill = 9999.0;

  // BorderRadius instances
  static const BorderRadius roundedXs = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius roundedSm = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius roundedMd = BorderRadius.all(Radius.circular(md));
  static const BorderRadius roundedLg = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius roundedPill = BorderRadius.all(
    Radius.circular(pill),
  );

  // Contextual aliases
  static const BorderRadius roundedCard = roundedMd;
  static const BorderRadius roundedInput = roundedMd;

  // Top Only Radii (e.g., Accent line / Modal sheets)
  static const BorderRadius roundedTopLg = BorderRadius.only(
    topLeft: Radius.circular(lg),
    topRight: Radius.circular(lg),
  );
}
