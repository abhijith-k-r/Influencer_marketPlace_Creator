import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';

/// Navigation buttons for Step 3 (Back to Step 2, Continue to Step 4).
class Step3ActionButtons extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onContinue;

  const Step3ActionButtons({
    super.key,
    required this.onBack,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 44,
          child: TextButton(
            onPressed: onBack,
            style: TextButton.styleFrom(
              backgroundColor: AppColors.inputBackground,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              shape: const RoundedRectangleBorder(
                borderRadius: AppRadii.roundedCard,
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.arrow_back_rounded, size: 14, color: AppColors.textPrimary),
                const SizedBox(width: 6),
                Text(
                  'Back',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: SizedBox(
            height: 44,
            child: ElevatedButton(
              onPressed: onContinue,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonPrimary,
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
                  const SizedBox(width: 6),
                  const Icon(Icons.arrow_forward_rounded, size: 14, color: AppColors.surfaceWhite),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
