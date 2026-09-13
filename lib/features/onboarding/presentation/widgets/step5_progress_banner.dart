import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'step5_done_badge.dart';

/// Micro celebration top stepper banner matching Figma Step 5.
class Step5ProgressBanner extends StatelessWidget {
  const Step5ProgressBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: AppRadii.roundedCard,
        gradient: const LinearGradient(
          colors: [
            Color(0x66E1E0FF),
            Color(0xFFEFF4FF),
            Color(0x4DDAE2FD),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryLight,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.verified,
                        size: 18,
                        color: AppColors.surfaceWhite,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'STEP 5 OF 5',
                            style: AppTextStyles.brandPill.copyWith(
                              fontSize: 11,
                              letterSpacing: 0.66,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '100% Ready for Submission',
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.fieldLabel.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Step5DoneBadge(),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 6,
            decoration: const BoxDecoration(
              color: AppColors.liveBadgeBackground,
              borderRadius: AppRadii.roundedPill,
            ),
            child: Container(
              height: 6,
              decoration: const BoxDecoration(
                color: AppColors.buttonPrimary,
                borderRadius: AppRadii.roundedPill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
