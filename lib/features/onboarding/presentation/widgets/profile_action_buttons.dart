import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';

/// Primary 'Continue' and secondary 'Save and continue later' buttons (Figma 2:255).
class ProfileActionButtons extends StatelessWidget {
  final VoidCallback onContinue;
  final VoidCallback? onSaveLater;

  const ProfileActionButtons({
    super.key,
    required this.onContinue,
    this.onSaveLater,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 4),
        Container(
          height: 44,
          decoration: const BoxDecoration(
            boxShadow: AppShadows.cardSoft,
            borderRadius: AppRadii.roundedCard,
          ),
          child: ElevatedButton(
            onPressed: onContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonPrimary,
              foregroundColor: AppColors.surfaceWhite,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: AppRadii.roundedCard,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Continue',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.surfaceWhite,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_rounded,
                  size: 14,
                  color: AppColors.surfaceWhite,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 44,
          child: TextButton(
            onPressed: onSaveLater,
            style: TextButton.styleFrom(
              backgroundColor: AppColors.inputBackground,
              shape: const RoundedRectangleBorder(
                borderRadius: AppRadii.roundedCard,
              ),
            ),
            child: Text(
              'Save and continue later',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
