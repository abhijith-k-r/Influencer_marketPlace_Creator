import 'package:flutter/material.dart';

/// Global elevation and shadow tokens matching the HTML styling.
abstract final class AppShadows {
  // Soft card shadow
  static const List<BoxShadow> cardSoft = [
    BoxShadow(
      color: Color(0x0A000000), // ~4% black
      blurRadius: 8,
      offset: Offset(0, 1),
    ),
  ];
  static const List<BoxShadow> cardSm = cardSoft;

  static const List<BoxShadow> cardMd = [
    BoxShadow(
      color: Color(0x0F000000), // ~6% black
      blurRadius: 16,
      offset: Offset(0, 4),
    ),
  ];

  static const List<BoxShadow> cardElevated = [
    BoxShadow(
      color: Color(0x14000000), // ~8% black
      blurRadius: 24,
      offset: Offset(0, 8),
    ),
  ];
  static const List<BoxShadow> cardLg = cardElevated;

  // Primary Button & glow
  static const List<BoxShadow> primaryButton = [
    BoxShadow(
      color: Color(0x40B9092F), // 25% primary
      blurRadius: 16,
      offset: Offset(0, 4),
    ),
  ];
  static const List<BoxShadow> primaryGlow = primaryButton;

  // Creator Blue glow
  static const List<BoxShadow> secondaryGlow = [
    BoxShadow(
      color: Color(0x402D37E6), // 25% secondary
      blurRadius: 16,
      offset: Offset(0, 4),
    ),
  ];

  // Bottom Navigation floating shadow
  static const List<BoxShadow> bottomNav = [
    BoxShadow(
      color: Color(0x1F0F172A), // 12% #0F172A
      blurRadius: 36,
      offset: Offset(0, 12),
    ),
  ];
}
