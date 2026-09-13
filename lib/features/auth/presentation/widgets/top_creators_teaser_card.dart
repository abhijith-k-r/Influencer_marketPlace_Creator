import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Teaser card highlighting creator platform activity and earnings.
class TopCreatorsTeaserCard extends StatelessWidget {
  const TopCreatorsTeaserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedMd,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: AppRadii.roundedSm,
            child: Image.asset(
              AppAssets.topCreator,
              width: 32,
              height: 32,
              fit: BoxFit.cover,
            ),
          ),
          AppSpacing.horizontalMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.topCreatorsOnboarded,
                  style: AppTextStyles.fieldLabel,
                ),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    AppSpacing.horizontalXs,
                    Flexible(
                      child: Text(
                        AppStrings.distributedThisMonth,
                        style: AppTextStyles.body,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: AppSpacing.paddingLiveBadge,
            decoration: BoxDecoration(
              color: AppColors.liveBadgeBackground,
              borderRadius: AppRadii.roundedPill,
            ),
            child: Text(AppStrings.live, style: AppTextStyles.liveBadge),
          ),
        ],
      ),
    );
  }
}
