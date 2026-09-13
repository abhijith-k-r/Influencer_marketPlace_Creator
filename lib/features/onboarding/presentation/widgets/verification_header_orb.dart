import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';

/// Top floating shield orb and headline for creator verification screen.
class VerificationHeaderOrb extends StatelessWidget {
  const VerificationHeaderOrb({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: AppColors.surfaceWhite,
                shape: BoxShape.circle,
                boxShadow: AppShadows.cardSoft,
              ),
              alignment: Alignment.center,
              child: Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  color: AppColors.pillBackground,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.verified_user,
                  size: 32,
                  color: AppColors.primary,
                ),
              ),
            ),
            Positioned(
              top: -2,
              right: -2,
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: AppColors.buttonPrimary,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.auto_awesome,
                  size: 14,
                  color: AppColors.surfaceWhite,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Verify your creator account',
          textAlign: TextAlign.center,
          style: AppTextStyles.h1,
        ),
        const SizedBox(height: 8),
        Text(
          'Verification helps brands trust your profile, unlock Tier-1 '
          'sponsorships, and discover genuine high-engagement talent.',
          textAlign: TextAlign.center,
          style: AppTextStyles.subtitle,
        ),
      ],
    );
  }
}
