import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Global Typography Tokens based on Plus Jakarta Sans design specs.
/// All font sizes, line heights, and weights are declared here.
abstract final class AppTextStyles {
  // Headings
  static TextStyle h1 = GoogleFonts.plusJakartaSans(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 32 / 24,
    letterSpacing: -0.6,
    color: AppColors.textPrimary,
  );

  static TextStyle h2 = GoogleFonts.plusJakartaSans(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 28 / 20,
    letterSpacing: -0.4,
    color: AppColors.textPrimary,
  );

  static TextStyle h3 = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 24 / 18,
    letterSpacing: -0.2,
    color: AppColors.textPrimary,
  );

  static TextStyle h4 = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 22 / 16,
    letterSpacing: -0.1,
    color: AppColors.textPrimary,
  );

  // Subtitle / Body
  static TextStyle subtitle = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 22 / 14,
    color: AppColors.textSecondary,
  );

  static TextStyle body = GoogleFonts.plusJakartaSans(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 18 / 13,
    letterSpacing: 0.065,
    color: AppColors.textSecondary,
  );

  static TextStyle bodyMedium = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 20 / 14,
    color: AppColors.textPrimary,
  );

  static TextStyle bodySmall = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
    color: AppColors.textSecondary,
  );

  static TextStyle caption = GoogleFonts.plusJakartaSans(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 14 / 11,
    color: AppColors.textSecondary,
  );

  // Form Field Labels & Hints
  static TextStyle fieldLabel = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 16 / 12,
    letterSpacing: 0.24,
    color: AppColors.textPrimary,
  );

  static TextStyle fieldInput = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static TextStyle fieldPlaceholder = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPlaceholder,
  );

  // Badges & Pills
  static TextStyle brandPill = GoogleFonts.plusJakartaSans(
    fontSize: 11, fontWeight: FontWeight.w700, height: 16 / 11, letterSpacing: 0.55, color: AppColors.primaryDark,
  );
  static TextStyle liveBadge = GoogleFonts.plusJakartaSans(
    fontSize: 11, fontWeight: FontWeight.w700, height: 16 / 11, letterSpacing: 0.66, color: AppColors.textSecondary,
  );
  static TextStyle trustBadge = GoogleFonts.plusJakartaSans(
    fontSize: 11, fontWeight: FontWeight.w700, height: 14 / 11, letterSpacing: 0.55, color: AppColors.textSecondary,
  );

  // Buttons & Links
  static TextStyle buttonPrimary = GoogleFonts.plusJakartaSans(
    fontSize: 14, fontWeight: FontWeight.w600, height: 20 / 14, letterSpacing: 0.14, color: AppColors.textWhite,
  );
  static TextStyle textLink = GoogleFonts.plusJakartaSans(
    fontSize: 12, fontWeight: FontWeight.w600, height: 16 / 12, letterSpacing: 0.24, color: AppColors.primary,
    decoration: TextDecoration.underline,
  );
  static TextStyle legalText = GoogleFonts.plusJakartaSans(
    fontSize: 13, fontWeight: FontWeight.w400, height: 16.25 / 13, letterSpacing: 0.065, color: AppColors.textSecondary,
  );

  // Messaging & Chat
  static TextStyle chatBubble = GoogleFonts.plusJakartaSans(
    fontSize: 13, fontWeight: FontWeight.w400, height: 1.4, color: AppColors.textPrimary,
  );
  static TextStyle chatTimestamp = GoogleFonts.plusJakartaSans(
    fontSize: 10, fontWeight: FontWeight.w500, color: AppColors.textSecondary,
  );
  static TextStyle chipAction = GoogleFonts.plusJakartaSans(
    fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
  );
}
