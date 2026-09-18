import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Global Typography Tokens matching the Plus Jakarta Sans specifications from HTML Tailwind config.
abstract final class AppTextStyles {
  // Display & Headlines
  static TextStyle displayLg({Color color = AppColors.onSurface}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 34,
        height: 40 / 34,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.5,
        color: color,
      );

  static TextStyle headlineLg({Color color = AppColors.onSurface}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 28,
        height: 34 / 28,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.4,
        color: color,
      );

  static TextStyle headlineMd({Color color = AppColors.onSurface}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 22,
        height: 28 / 22,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.3,
        color: color,
      );

  static TextStyle headlineSm({Color color = AppColors.onSurface}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 18,
        height: 24 / 18,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
        color: color,
      );

  // Labels
  static TextStyle labelLg({Color color = AppColors.onSurface}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 15,
        height: 20 / 15,
        fontWeight: FontWeight.w600,
        color: color,
      );

  static TextStyle labelMd({Color color = AppColors.tertiary}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w600,
        color: color,
      );

  static TextStyle labelSm({Color color = AppColors.tertiary}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 11,
        height: 14 / 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.2,
        color: color,
      );

  // Body
  static TextStyle bodyLg({Color color = AppColors.onSurface}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 16,
        height: 22 / 16,
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle bodyMd({Color color = AppColors.tertiary}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle bodySm({Color color = AppColors.tertiary}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 13,
        height: 18 / 13,
        fontWeight: FontWeight.w400,
        color: color,
      );

  // Currency / Numeric Display
  static TextStyle currencyDisplay({Color color = AppColors.onSurface}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 24,
        height: 28 / 24,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.3,
        color: color,
      );

  // Backward-compatibility & semantic getters
  static TextStyle get brandPill => labelSm();
  static TextStyle get body => bodyMd();
  static TextStyle get bodySmall => bodySm();
  static TextStyle get bodyMedium => bodyMd();
  static TextStyle get caption => labelSm();
  static TextStyle get fieldLabel => labelMd();
  static TextStyle get fieldInput => bodyMd(color: AppColors.onSurface);
  static TextStyle get fieldPlaceholder => bodyMd(color: AppColors.tertiary);
  static TextStyle get buttonPrimary => labelLg(color: Colors.white);
  static TextStyle get h1 => headlineLg();
  static TextStyle get h3 => headlineSm();
  static TextStyle get h4 => headlineSm();
  static TextStyle get subtitle => bodyLg(color: AppColors.tertiary);
  static TextStyle get textLink => labelMd(color: AppColors.primary);
  static TextStyle get legalText => labelSm(color: AppColors.tertiary);
  static TextStyle get liveBadge => labelSm(color: AppColors.primary);
  static TextStyle get trustBadge => labelSm(color: AppColors.onSurfaceVariant);
}
