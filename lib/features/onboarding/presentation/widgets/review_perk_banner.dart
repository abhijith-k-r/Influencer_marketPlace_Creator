import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';

/// Verified Creator Perk banner with celebration emoji and rich text.
class ReviewPerkBanner extends StatelessWidget {
  const ReviewPerkBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: AppRadii.roundedCard,
        boxShadow: AppShadows.cardSoft,
        gradient: const LinearGradient(
          colors: [
            Color(0x80E1E0FF),
            AppColors.trustBadgeBackground,
            Color(0x4DC4E7FF),
          ],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: AppColors.surfaceWhite,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text('🎉', style: TextStyle(fontSize: 18)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verified Creator Perk',
                  style: AppTextStyles.fieldLabel.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                RichText(
                  text: TextSpan(
                    style: AppTextStyles.body.copyWith(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                      height: 18 / 13,
                    ),
                    children: [
                      const TextSpan(
                        text:
                            'Profiles with verified social accounts receive ',
                      ),
                      TextSpan(
                        text: '3x more brand invitations',
                        style: AppTextStyles.body.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      const TextSpan(
                        text: ' and expedited contract clearing!',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
