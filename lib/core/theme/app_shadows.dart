import 'package:flutter/material.dart';

/// Global Box Shadow & Elevation Tokens.
/// Exact Figma drop shadow specifications.
abstract final class AppShadows {
  // Soft surface shadow for small cards and pills
  static const List<BoxShadow> cardSoft = [
    BoxShadow(
      color: Color(0x0D000000), // rgba(0, 0, 0, 0.05)
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  ];

  // Elevated main form card shadow
  static const List<BoxShadow> cardElevated = [
    BoxShadow(
      color: Color(0x1A000000), // rgba(0, 0, 0, 0.1)
      offset: Offset(0, 8),
      blurRadius: 10,
      spreadRadius: -6,
    ),
    BoxShadow(
      color: Color(0x1A000000), // rgba(0, 0, 0, 0.1)
      offset: Offset(0, 20),
      blurRadius: 25,
      spreadRadius: -5,
    ),
  ];

  // Primary CTA Button shadow
  static const List<BoxShadow> primaryButton = [
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -4,
    ),
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 10),
      blurRadius: 15,
      spreadRadius: -3,
    ),
  ];

  // Avatar overlap outline shadow
  static const List<BoxShadow> avatarRing = [
    BoxShadow(color: Color(0x0D000000), offset: Offset(0, 1), blurRadius: 2),
    BoxShadow(
      color: Color(0xFFFFFFFF),
      offset: Offset(0, 0),
      blurRadius: 0,
      spreadRadius: 2,
    ),
  ];

  // Subtle chat and micro element drop shadows
  static const List<BoxShadow> subtle = [
    BoxShadow(
      color: Color(0x06000000),
      blurRadius: 4,
      offset: Offset(0, 1),
    ),
  ];

  // Floating pill input bar shadow
  static const List<BoxShadow> floating = [
    BoxShadow(
      color: Color(0x0C000000),
      blurRadius: 10,
      offset: Offset(0, 2),
    ),
  ];

  // Escrow card glowing elevation
  static const List<BoxShadow> escrow = [
    BoxShadow(
      color: Color(0x596D28D9),
      blurRadius: 20,
      offset: Offset(0, 10),
    ),
  ];
}
