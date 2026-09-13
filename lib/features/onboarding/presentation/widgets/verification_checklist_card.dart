import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'verification_active_item.dart';
import 'verification_checklist_item.dart';
import 'verification_social_chips.dart';

/// Verification Checklist Card with completed items and active in-progress item.
class VerificationChecklistCard extends StatelessWidget {
  const VerificationChecklistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedCard,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Verification Checklist',
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.fieldLabel.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: const BoxDecoration(
                  color: AppColors.trustBadgeBackground,
                  borderRadius: AppRadii.roundedPill,
                ),
                child: Text(
                  '3 / 4 DONE',
                  style: AppTextStyles.brandPill.copyWith(
                    fontSize: 11,
                    letterSpacing: 0.55,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          VerificationChecklistItem(
            title: 'Email address',
            statusText: 'Verified',
            details: Text(
              'alex@creator.com',
              style: AppTextStyles.body.copyWith(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const Divider(height: 1, color: AppColors.inputBackground),
          const VerificationChecklistItem(
            title: 'Social account verification',
            statusText: '3 Synced',
            details: Padding(
              padding: EdgeInsets.only(top: 4),
              child: VerificationSocialChips(),
            ),
          ),
          const Divider(height: 1, color: AppColors.inputBackground),
          VerificationChecklistItem(
            title: 'Creator profile baseline',
            statusText: '100% complete',
            details: Text(
              'Media kit, audience demographics & deliverables catalog submitted',
              style: AppTextStyles.body.copyWith(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(height: 6),
          const VerificationActiveItem(),
        ],
      ),
    );
  }
}
